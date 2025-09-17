import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:lotto_application/config/api_endpoints.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController amount = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1F5FE),
      body: Center(
        // Wrap with Center to center the content vertically and horizontally
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [buildRegisterBox(context)],
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
              fontSize: 24, // ขนาดฟอนต์ของหัวข้อ
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12), // ลดระยะห่าง
          buildTextField('ชื่อผู้ใช้', 'กรอกชื่อผู้ใช้', controller: username),
          const SizedBox(height: 12),
          buildTextField('อีเมล', 'กรอกอีเมล', controller: email),
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
          buildTextField(
            'กรุณาระบุยอดฝากที่ต้องการฝาก',
            'ระบบุจำนวนยอดฝาก',
            controller: amount,
          ),
          const SizedBox(height: 12),
          const Text(
            '*ยอดขั้นต่ำ 100 บาท',
            style: TextStyle(fontSize: 12, color: Colors.red), // ลดขนาดฟอนต์
          ),
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
                      fontSize: 16, // ขนาดฟอนต์ของปุ่ม
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _isLoading
                  ? const CircularProgressIndicator()
                  : buildButton(
                      context,
                      'สมัครสมาชิก',
                      const Color(0xFFFFF59D),
                      Colors.black,
                      _register,
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
              fontSize: 15, // ขนาดฟอนต์ของ Label
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

  // ฟังก์ชันสร้างปุ่ม
  Widget buildButton(
    BuildContext context,
    String text,
    Color backgroundColor,
    Color textColor,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      child: Text(text),
    );
  }

  // ฟังก์ชันสำหรับจัดการการลงทะเบียน
  void _register() async {
    log('Username: "${username.text}"');
    log('Email: "${email.text}"');
    log('Password: "${password.text}"');
    log('Confirm Password: "${confirmpassword.text}"');
    log('Amount: "${amount.text}"');
    // --- 1. Input Validation ---
    if (username.text.isEmpty ||
        email.text.isEmpty ||
        password.text.isEmpty ||
        confirmpassword.text.isEmpty ||
        amount.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('กรุณากรอกข้อมูลให้ครบทุกช่อง')),
      );
      return;
    }

    if (password.text != confirmpassword.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('รหัสผ่านไม่ตรงกัน')));
      return;
    }

    final double? depositAmount = double.tryParse(amount.text);
    if (depositAmount == null || depositAmount < 100) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('ยอดฝากขั้นต่ำคือ 100 บาท')));
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // --- 2. API Call ---
      final response = await http.post(
        Uri.parse(ApiEndpoints.register),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username.text.trim(),
          'email': email.text.trim(),
          'password': password.text.trim(),
          'wallet_balance': depositAmount,
        }),
      );

      if (!mounted) return;

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 201) {
        // --- 3. Success ---
        log('Registration successful: ${responseData['message']}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('สมัครสมาชิกสำเร็จ! กรุณาเข้าสู่ระบบ')),
        );
        Navigator.pop(context); // กลับไปหน้า Login
      } else {
        // --- 4. Failure ---
        final errorMessage =
            responseData['message'] ?? 'เกิดข้อผิดพลาดในการสมัคร';
        log('Registration failed: $errorMessage');
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(errorMessage)));
      }
    } catch (e) {
      log('An error occurred during registration: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ไม่สามารถเชื่อมต่อกับเซิร์ฟเวอร์ได้')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
