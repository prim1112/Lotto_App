import 'package:flutter/material.dart';
import 'package:lotto_application/pages/login.dart';
import 'package:lotto_application/pages/profile/profile_edit.dart';
import '../customer/homepage.dart'; // Import Homepage

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
                  child: Image.asset(
                    'assets/images/Screenshot (1724).png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFE1F5FE),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/proflie.png', width: 150, height: 150),
              const SizedBox(height: 20),
              const Text('User', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 16),
              buildButton('แก้ไขโปรไฟล์', 'กรอกชื่อผู้ใช้', context),
              const SizedBox(height: 16),
              buildButton('Log out', 'กรอกรหัสผ่าน', context, isLogOut: true),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(
    String label,
    String hint,
    BuildContext context, {
    bool isLogOut = false,
  }) {
    return ElevatedButton(
      onPressed: () {
        if (label == 'แก้ไขโปรไฟล์') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfileEditPage(),
            ), // Change to ProfileEditPage
          );
        } else if (isLogOut) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (route) => false,
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(label),
                content: Text(hint),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('ปิด'),
                  ),
                ],
              );
            },
          );
        }
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        minimumSize: const Size(300, 50),
        side: const BorderSide(color: Colors.black, width: 2),
      ),
      child: Text(label, style: const TextStyle(fontSize: 16)),
    );
  }
}
