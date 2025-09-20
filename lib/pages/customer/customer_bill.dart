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

// ------------------------------------------------------------------
// 1. หน้าหลักสำหรับแสดงรายการสลากทั้งหมด
// ------------------------------------------------------------------
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
      return;
    }

    try {
      final response = await http.get(
        Uri.parse(ApiEndpoints.getUserTickets(userId.toString())),
      );
      if (mounted) {
        if (response.statusCode == 200) {
          setState(() {
            _userTickets = jsonDecode(response.body);
            _isLoading = false;
          });
        } else {
          setState(() => _isLoading = false);
        }
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('สลากทั้งหมดของฉัน')),
      backgroundColor: Colors.grey[200],
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _userTickets.isEmpty
          ? const Center(child: Text('คุณยังไม่มีสลากที่ซื้อ'))
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _userTickets.length,
              itemBuilder: (context, index) {
                return UserTicketCard(ticketData: _userTickets[index]);
              },
            ),
      bottomNavigationBar: widgetbar,
    );
  }
}

// ------------------------------------------------------------------
// 2. Widget Card สำหรับสลาก 1 ใบ (StatefulWidget)
// ------------------------------------------------------------------
class UserTicketCard extends StatefulWidget {
  final Map<String, dynamic> ticketData;
  const UserTicketCard({super.key, required this.ticketData});

  @override
  State<UserTicketCard> createState() => _UserTicketCardState();
}

class _UserTicketCardState extends State<UserTicketCard> {
  bool _isChecking = false; // State สำหรับแสดงสถานะกำลังโหลดของ Card ใบนี้

  // ฟังก์ชันตรวจรางวัล (เหมือนกับที่คุณเขียนมา แต่ปรับปรุงเล็กน้อย)
  Future<void> checkLottery() async {
    setState(() => _isChecking = true); // เริ่มโหลด

    try {
      final response = await http.get(Uri.parse(ApiEndpoints.getLatestResults));
      String message = "เกิดข้อผิดพลาดในการโหลดผลรางวัล";

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final String myLotteryNumber = widget.ticketData['ticket_number'];

        // จัดรูปแบบวันที่
        final drawDate = DateTime.parse(data["draw_date"]);
        final formattedDate = DateFormat(
          'งวดวันที่ d MMMM yyyy',
          'th',
        ).format(drawDate);

        if (myLotteryNumber == data["prize1_number"]) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WinPage(
                ticketNumber: myLotteryNumber,
                prizeName: "รางวัลที่ 1",
                reward: 10000000,
                drawDate: formattedDate,
              ),
            ),
          );
        } else if (myLotteryNumber == data["prize2_number"]) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WinPage(
                ticketNumber: myLotteryNumber,
                prizeName: "รางวัลที่ 2",
                reward: 5000000,
                drawDate: formattedDate,
              ),
            ),
          );
        } else if (myLotteryNumber == data["prize3_number"]) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WinPage(
                ticketNumber: myLotteryNumber,
                prizeName: "รางวัลที่ 3",
                reward: 1000000,
                drawDate: formattedDate,
              ),
            ),
          );
        } else if (myLotteryNumber.endsWith(data["last3_number"])) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WinPage(
                ticketNumber: myLotteryNumber,
                prizeName: "รางวัลเลขท้าย 3 ตัว",
                reward: 500000,
                drawDate: formattedDate,
              ),
            ),
          );
        } else if (myLotteryNumber.endsWith(data["last2_number"])) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WinPage(
                ticketNumber: myLotteryNumber,
                prizeName: "รางวัลเลขท้าย 2 ตัว",
                reward: 100000,
                drawDate: formattedDate,
              ),
            ),
          );
        } else {
          // เมื่อไม่ถูกรางวัล จะเปิดหน้า LosePage
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LosePage(
                ticketNumber: myLotteryNumber,
                drawDate: formattedDate,
              ),
            ),
          );
        }
      }

      // อัปเดตข้อความผลลัพธ์สำหรับ Card ใบนี้
    } finally {
      setState(() => _isChecking = false); // หยุดโหลด
    }
  }

  @override
  Widget build(BuildContext context) {
    final String ticketNumber = widget.ticketData['ticket_number'];

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
                  // ถ้ากำลังโหลด ให้ disable ปุ่ม, ถ้ามีผลแล้ว ก็ disable ปุ่ม
                  onPressed: _isChecking ? null : checkLottery,
                  child: _isChecking
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text(
                          'ตรวจสลาก',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // แสดงผลการตรวจ ถ้ามีข้อความ
          ],
        ),
      ),
    );
  }
}
