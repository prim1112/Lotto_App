import 'package:flutter/material.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE1F5FE),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 180, 0),
                child: SizedBox(
                  width: 140,
                  child: Image.asset('assets/images/Screenshot (1724).png',
                      fit: BoxFit.contain),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFE1F5FE),
        child: Column(
          children: [
            const Spacer(), // เพิ่มพื้นที่ว่างด้านบน
            Expanded(
              flex: 70, // ปรับความสูงของกรอบให้เหมาะสม
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    width: 300, // ขนาดกรอบ
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      // border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        // รูปโปรไฟล์
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/proflie.png'),
                          radius: 50, // ขนาดของวงกลม
                        ),
                        Text(
                          'แก้ไขโปรไฟล์',
                          style: TextStyle(
                            fontSize: 18, // ขนาดตัวอักษร
                            fontWeight: FontWeight.bold, // ทำตัวอักษรหนา
                          ),
                        ),

                        const SizedBox(height: 16),
                        buildTextField('ชื่อผู้ใช้', 'กรอกชื่อผู้ใช้'),
                        const SizedBox(height: 16),
                        buildTextField('e-mail', 'กรอกชื่อe-mail'),
                        const SizedBox(height: 16),
                        buildTextField('รหัสผ่าน', 'กรอกรหัสผ่าน',
                            obscureText: true),
                        const SizedBox(height: 35),
                        buildButtonRow(context),
                        const SizedBox(height: 16), // เพิ่มพื้นที่ด้านล่างกรอบ
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // const Spacer(), // เพิ่มพื้นที่ว่างด้านล่าง
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, String hint, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildButton(
          context,
          'ยกเลิก',
          Colors.red, // สีแดงสำหรับปุ่มยกเลิก
          Colors.white,
          () {
            Navigator.pop(context); // กลับไปที่หน้าโปรไฟล์
          },
        ),
        const SizedBox(width: 8), // ระยะห่างระหว่างปุ่ม
        buildButton(
          context,
          'ยืนยัน',
          const Color(0xFFFFF59D), // สีสำหรับปุ่มบันทึก
          Colors.black,
          () {
            // บันทึกการเปลี่ยนแปลง
          },
        ),
      ],
    );
  }

  Widget buildButton(BuildContext context, String text, Color bgColor,
      Color textColor, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        foregroundColor: textColor,
        backgroundColor: bgColor,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
