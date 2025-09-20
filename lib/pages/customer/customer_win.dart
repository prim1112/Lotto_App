import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WinPage extends StatelessWidget {
  final String ticketNumber;
  final String prizeName;
  final int reward;
  final String drawDate; // เรายังรับค่านี้มา แต่ในดีไซน์ใหม่จะไม่ได้แสดง

  const WinPage({
    super.key,
    required this.ticketNumber,
    required this.prizeName,
    required this.reward,
    required this.drawDate,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat("#,##0", "en_US");

    return Scaffold(
      // 1. เปลี่ยนสีพื้นหลังให้ตรงกับรูปภาพ
      backgroundColor: const Color(0xFFCDEBFF),
      appBar: AppBar(
        // ทำให้ AppBar โปร่งใสและไม่มีเงา
        backgroundColor: Colors.transparent,
        elevation: 0,
        // เพิ่มไอคอน back button ให้เป็นสีเข้มเพื่อให้มองเห็น
        iconTheme: const IconThemeData(color: Colors.black54),
      ),
      body: Center(
        child: Padding(
          // 2. ปรับระยะห่างรอบ Card
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Card(
            elevation: 8,
            shadowColor: Colors.black.withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // ทำให้ Card มนขึ้น
            ),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // ทำให้ Column สูงเท่าที่จำเป็น
                children: [
                  // 3. รูปภาพด้านบน
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/images/Joy.png', // <-- ตรวจสอบว่า path รูปภาพถูกต้อง
                      width: double.infinity,
                      height: 250, // กำหนดความสูงรูปภาพ
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 4. โครงสร้าง Text ที่ปรับแก้ใหม่ทั้งหมด
                  Text(
                    ticketNumber,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: 2, // เพิ่มระยะห่างระหว่างตัวอักษร
                    ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    'ถูก$prizeName',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    'เงินรางวัล',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 4),

                  Text(
                    currencyFormatter.format(reward),
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  const Text(
                    'บาท',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 32),

                  // 5. ปุ่ม "ขึ้นเงินรางวัล"
                  ElevatedButton(
                    onPressed: () {
                      // TODO: ใส่ Logic การขึ้นเงินรางวัล
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFF59D),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      elevation: 3,
                    ),
                    child: const Text(
                      'ขึ้นเงินรางวัล',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
