import 'package:flutter/material.dart';

class LosePage extends StatelessWidget {
  final String ticketNumber;
  final String drawDate; // รับค่ามา แต่ไม่ได้ใช้ในดีไซน์ใหม่

  const LosePage({
    super.key,
    required this.ticketNumber,
    required this.drawDate,
  });

  @override
  Widget build(BuildContext context) {
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
                      'assets/images/Sadness.png', // <-- ตรวจสอบว่า path รูปภาพถูกต้อง
                      width: double.infinity,
                      height: 300, // กำหนดความสูงรูปภาพ
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // 4. โครงสร้าง Text ที่ปรับแก้ใหม่ทั้งหมด
                  Text(
                    ticketNumber,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    'ไม่ถูกรางวัล',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 48),

                  // 5. ปุ่ม "ย้อนกลับ"
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
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
                      'ย้อนกลับ',
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
