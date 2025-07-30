import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lotto_application/pages/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var url = '';
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1F5FE),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight:
                      MediaQuery.of(context).size.height *
                      0.8, // Limit height to 80% of screen height
                ),
                child: Container(
                  width: 280,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildLogo(),
                      const SizedBox(height: 20),
                      buildTextField(
                        'ชื่อผู้ใช้',
                        'กรอกชื่อผู้ใช้',
                        controller: username,
                      ),
                      const SizedBox(height: 13),
                      buildTextField(
                        'Email',
                        'กรอกชื่ออีเมล',
                        controller: email,
                      ),
                      const SizedBox(height: 13),
                      buildTextField(
                        'รหัสผ่าน',
                        'กรอกรหัสผ่าน',
                        controller: password,
                        obscureText: true,
                      ),
                      const SizedBox(height: 30),
                      buildButtonRow(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLogo() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: SizedBox(
          width: 120,
          height: 120,
          child: Image.asset('assets/images/cat.jpg', fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget buildTextField(
    String label,
    String hint, {
    bool obscureText = false,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: TextField(
              obscureText: obscureText,
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 10.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: register,
          child: const Text(
            'สมัครสมาชิก',
            style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        const SizedBox(width: 8),
        buildButton(
          context,
          'เข้าสู่ระบบ',
          const Color(0xFFFFF59D),
          Colors.black,
          LoginPage, // ส่งฟังก์ชัน LoginPage เข้าไปตรงนี้
        ),
      ],
    );
  }

  Widget buildButton(
    BuildContext context,
    String text,
    Color bgColor,
    Color textColor,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: 100,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          foregroundColor: textColor,
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Colors.black, width: 1),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }

  void LoginPage() {}

  void register() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }
}
