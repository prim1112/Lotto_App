// win_page.dart
import 'dart:convert';
import 'dart:developer' as dev;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:lotto_application/config/api_endpoints.dart';
import 'package:lotto_application/services/user_session.dart';

class WinPage extends StatefulWidget {
  final String ticketNumber;
  final String prizeName;
  final int reward;
  final String drawDate; // แสดงผล
  final String? drawDateIso; // สำหรับ API
  final VoidCallback? onClaimed; // callback ให้ WalletPage อัปเดตเงิน

  const WinPage({
    super.key,
    required this.ticketNumber,
    required this.prizeName,
    required this.reward,
    required this.drawDate,
    this.drawDateIso,
    this.onClaimed,
  });

  @override
  State<WinPage> createState() => _WinPageState();
}

class _WinPageState extends State<WinPage> {
  bool _isClaiming = false;

  Future<void> _claimByNumber() async {
    if (_isClaiming) return;

    final userId = UserSession().currentUser?.userId;
    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('กรุณาเข้าสู่ระบบก่อน')),
      );
      return;
    }

    setState(() => _isClaiming = true);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    try {
      final url = Uri.parse(ApiEndpoints.claim);
      final headers = {'Content-Type': 'application/json'};
      final body = <String, dynamic>{
        'userId': userId,
        'ticketNumber': widget.ticketNumber,
        if ((widget.drawDateIso ?? '').isNotEmpty) 'drawDate': widget.drawDateIso,
      };

      if (kDebugMode) dev.log('CLAIM body => ${jsonEncode(body)}');

      final res = await http.post(url, headers: headers, body: jsonEncode(body));

      if (mounted) Navigator.of(context).pop(); // ปิด Loading

      bool success = res.statusCode >= 200 && res.statusCode < 300;
      String msg = success ? 'ขึ้นเงินรางวัลสำเร็จ' : 'ขึ้นเงินรางวัลล้มเหลว';

      if (!success) {
        try {
          final jsonResp = jsonDecode(res.body);
          msg = jsonResp['message'] ?? msg;
        } catch (_) {}
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

      if (success && mounted) {
        widget.onClaimed?.call(); // รีโหลดยอด WalletPage
        Navigator.pop(context, true); // ปิด WinPage
      }
    } catch (e, st) {
      if (mounted) Navigator.of(context).pop();
      if (kDebugMode) dev.log('claim-error', error: e, stackTrace: st);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('เกิดข้อผิดพลาด: $e')),
      );
    } finally {
      if (mounted) setState(() => _isClaiming = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat("#,##0", "en_US");

    return Scaffold(
      backgroundColor: const Color(0xFFCDEBFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black54),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Card(
            elevation: 8,
            shadowColor: Colors.black.withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    'assets/images/Joy.png',
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  widget.ticketNumber,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'ถูก${widget.prizeName}',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                const SizedBox(height: 24),
                const Text('เงินรางวัล', style: TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 4),
                Text(
                  currencyFormatter.format(widget.reward),
                  style: const TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const Text('บาท', style: TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _isClaiming ? null : _claimByNumber,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFF59D),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    elevation: 3,
                  ),
                  child: Text(
                    _isClaiming ? 'กำลังดำเนินการ...' : 'ขึ้นเงินรางวัล',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
