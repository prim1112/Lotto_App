import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String text = '';
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController amount = TextEditingController();
  String url = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1F5FE),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ใส่รูปโลโก้ด้านนอก Container
                Image.asset(
                  'assets/images/Screenshot (1723).png', // ระบุ path ของรูปโลโก้
                  height: 150, // ลดขนาดโลโก้
                  width: 150,
                ),
                buildRegisterBox(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRegisterBox(BuildContext context) {
    return Container(
      width: 350, // ขนาดของ Container
      padding: const EdgeInsets.all(12.0), // padding ภายใน Container
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30), // ลดขอบมุมให้น้อยลง
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'สมัครสมาชิก',
            style: TextStyle(
              fontSize: 16, // ขนาดฟอนต์ของหัวข้อ
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12), // ลดระยะห่าง
          buildTextField('ชื่อผู้ใช้', 'กรอกชื่อผู้ใช้', controller: username),
          const SizedBox(height: 12),
          buildTextField('อีเมล', 'กรอกอีเมลของคุณ', controller: email),
          const SizedBox(height: 12),
          buildTextField(
            'รหัสผ่าน',
            'กรอกรหัสผ่าน',
            controller: password,
            obscureText: true,
          ),
          const SizedBox(height: 12),
          buildTextField(
            'ยืนยันรหัสผ่าน',
            'กรอกรหัสผ่านอีกครั้ง',
            controller: confirmpassword,
            obscureText: true,
          ),
          const SizedBox(height: 12),
          // buildTextField('กรุณาระบุยอดฝากที่ต้องการฝาก', 'ระบบุจำนวนยอดฝาก',
          //     controller: amount),
          // const SizedBox(height: 12),
          // const Text(
          //   'ขั้นต่ำ 100 บาท',
          //   style: TextStyle(fontSize: 12), // ลดขนาดฟอนต์
          // ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'หากมีบัญชีอยู่แล้ว',
                style: TextStyle(fontSize: 12), // ลดขนาดฟอนต์
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'เข้าสู่ระบบ',
                    style: TextStyle(
                      fontSize: 14, // ขนาดฟอนต์ของปุ่ม
                      color: Color.fromARGB(255, 255, 0, 0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ฟังก์ชันสร้างช่องกรอกข้อมูล
  Widget buildTextField(
    String label,
    String hint, {
    bool obscureText = false,
    required controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4.0,
      ), // padding ของ TextField
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12, // ขนาดฟอนต์ของ Label
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 3),
          TextField(
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50), // ลดขอบมุม TextField
              ),
            ),
          ),
        ],
      ),
    );
  }
}
