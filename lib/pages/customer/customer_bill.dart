import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:lotto_application/config/api_endpoints.dart';
import 'package:lotto_application/pages/customer/WidgetBar.dart';
import 'package:lotto_application/services/user_session.dart';
import 'customer_win.dart';
import 'customer_lose.dart';

class MyTicketsPage extends StatefulWidget {
  const MyTicketsPage({super.key});

  @override
  State<MyTicketsPage> createState() => _MyTicketsPageState();
}

class _MyTicketsPageState extends State<MyTicketsPage> {
  bool _isLoading = true;
  final Widgetbar widgetbar = const Widgetbar(selectedIndex: 0);
  List<dynamic> _userTickets = [];

  @override
  void initState() {
    super.initState();
    _fetchUserTickets();
  }

  Future<void> _fetchUserTickets() async {
    final userId = UserSession().currentUser?.userId;
    if (userId == null) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('ยังไม่ได้เข้าสู่ระบบ')));
      }
      return;
    }

    final url = ApiEndpoints.getUserTickets(userId.toString());
    log('[GET] $url');

    try {
      final res = await http.get(Uri.parse(url));
      log('[RES] status=${res.statusCode}');
      log('[RES] body=${res.body}');

      if (!mounted) return;

      if (res.statusCode == 200) {
        final decoded = jsonDecode(res.body);
        final list = decoded is List ? decoded : (decoded['data'] ?? []);

        final List<Map<String, dynamic>> allTickets =
            List<Map<String, dynamic>>.from(list);

        // กรองเฉพาะสถานะ 'claimed' ออกไปเท่านั้น
        final List<dynamic> unHandledTickets = allTickets.where((ticket) {
          final status = ticket['status'];
          return status != 'claimed';
        }).toList();

        setState(() {
          _userTickets = unHandledTickets;
          _isLoading = false;
        });
      } else {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('โหลดสลากไม่สำเร็จ: ${res.statusCode}')),
        );
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('เกิดข้อผิดพลาด: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('สลากทั้งหมดของฉัน')),
      backgroundColor: const Color(0xFFCDEBFF),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _userTickets.isEmpty
          ? const Center(child: Text('คุณยังไม่มีสลาก'))
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _userTickets.length,
              itemBuilder: (context, index) {
                return UserTicketCard(
                  ticketData: _userTickets[index],
                  onReload: _fetchUserTickets, // ส่ง callback ให้รีโหลดได้
                );
              },
            ),
      bottomNavigationBar: widgetbar,
    );
  }
}

class UserTicketCard extends StatefulWidget {
  final Map<String, dynamic> ticketData;
  final Future<void> Function()? onReload;

  const UserTicketCard({super.key, required this.ticketData, this.onReload});

  @override
  State<UserTicketCard> createState() => _UserTicketCardState();
}

class _UserTicketCardState extends State<UserTicketCard> {
  bool _isChecking = false;
  bool _isClaimed = false;
  bool _isAlreadyChecked = false;
  String? _statusText;

  @override
  void initState() {
    super.initState();
    final String initialStatus = widget.ticketData['status'] ?? 'available';

    if (initialStatus == 'checked') {
      _isAlreadyChecked = true;
      _statusText = 'ตรวจแล้ว: ไม่ถูกรางวัล';
    } else if (initialStatus == 'claimed') {
      _isClaimed = true;
      _statusText = 'ขึ้นเงินรางวัลแล้ว';
    }
  }

  Future<void> checkLottery() async {
    if (_isChecking) return;

    setState(() {
      _isChecking = true;
      _statusText = null;
    });

    try {
      final resp = await http.get(Uri.parse(ApiEndpoints.getLatestResults));
      if (resp.statusCode != 200) {
        setState(() => _statusText = 'เกิดข้อผิดพลาดในการโหลดผลรางวัล');
        return;
      }

      final data = json.decode(resp.body);
      final String ticketNumber = widget.ticketData['ticket_number'].toString();

      final isoFromApi = data["draw_date"] as String;
      final dt = DateTime.parse(isoFromApi);
      final formattedDate = DateFormat(
        'งวดวันที่ d MMMM yyyy',
        'th',
      ).format(dt);

      String? prizeName;
      int? reward;
      if (ticketNumber == data["prize1_number"]) {
        prizeName = "รางวัลที่ 1";
        reward = 10000000;
      } else if (ticketNumber == data["prize2_number"]) {
        prizeName = "รางวัลที่ 2";
        reward = 5000000;
      } else if (ticketNumber == data["prize3_number"]) {
        prizeName = "รางวัลที่ 3";
        reward = 1000000;
      } else if (ticketNumber.endsWith(data["last3_number"])) {
        prizeName = "รางวัลเลขท้าย 3 ตัว";
        reward = 500000;
      } else if (ticketNumber.endsWith(data["last2_number"])) {
        prizeName = "รางวัลเลขท้าย 2 ตัว";
        reward = 100000;
      }

      if (prizeName != null && reward != null) {
        final dynamic result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => WinPage(
              ticketNumber: ticketNumber,
              prizeName: prizeName!,
              reward: reward!,
              drawDate: formattedDate,
            ),
          ),
        );

        if (result != null && result is double && mounted) {
          final double newBalance = result;
          UserSession().currentUser?.walletBalance = newBalance;
          setState(() {
            _isClaimed = true;
            _statusText = 'ขึ้นเงินรางวัลแล้ว';
          });
          await widget.onReload?.call();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('ยอดเงินใน Wallet ได้รับการอัปเดตแล้ว'),
            ),
          );
        }
      } else {
        if (!mounted) return;

        final bool marked = await _markTicketAsChecked(ticketNumber);

        if (marked && mounted) {
          setState(() {
            _isAlreadyChecked = true;
            _statusText = 'ตรวจแล้ว: ไม่ถูกรางวัล';
          });
        }

        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                LosePage(ticketNumber: ticketNumber, drawDate: formattedDate),
          ),
        );

        await widget.onReload?.call();
      }
    } catch (e) {
      setState(() => _statusText = 'ผิดพลาด: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('ผิดพลาด: $e')));
    } finally {
      if (mounted) setState(() => _isChecking = false);
    }
  }

  String _getButtonText() {
    if (_isClaimed) return 'ขึ้นเงินแล้ว';
    if (_isAlreadyChecked) return 'ตรวจแล้ว';
    return 'ตรวจสลาก';
  }

  @override
  Widget build(BuildContext context) {
    final String ticketNumber = widget.ticketData['ticket_number'].toString();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.confirmation_number,
                  size: 60,
                  color: Color(0xFF1A237E),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'สลากกินแบ่ง',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF1A237E),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        height: 35,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF59D),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          ticketNumber,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (_statusText != null)
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _statusText!,
                  style: TextStyle(
                    fontSize: 14,
                    color: _isClaimed ? Colors.green[700] : Colors.red[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'ราคา 80 บาท',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFF59D),
                  ),
                  onPressed: (_isChecking || _isClaimed || _isAlreadyChecked)
                      ? null
                      : checkLottery,
                  child: _isChecking
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(
                          _getButtonText(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _markTicketAsChecked(String ticketNumber) async {
    final userId = UserSession().currentUser?.userId;
    if (userId == null) return false;

    try {
      final res = await http.post(
        Uri.parse(ApiEndpoints.markAsChecked),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'userId': userId, 'ticketNumber': ticketNumber}),
      );

      if (res.statusCode == 200) {
        log('Successfully marked ticket $ticketNumber as checked.');
        return true;
      } else {
        log(
          'Failed to mark ticket as checked. Status: ${res.statusCode}, Body: ${res.body}',
        );
        return false;
      }
    } catch (e) {
      log('Error marking ticket as checked: $e');
      return false;
    }
  }
}
