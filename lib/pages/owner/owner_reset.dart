import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lotto_application/config/api_endpoints.dart';
import 'package:lotto_application/pages/login.dart';
import 'package:lotto_application/services/user_session.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  bool _isLoading = false;
  bool _isResetting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1F5FE),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: const Color(0xFFE1F5FE),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            SizedBox(
              width: 90,
              height: 90,
              child: Image.asset('assets/images/proflie1.png'),
            ),
            const SizedBox(height: 10),
            const Text(
              'Admin',
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
            const SizedBox(height: 10),
            const Text(
              'ลบข้อมูลระบบทั้งหมด',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 13),
            ),
            const SizedBox(height: 5),
            const Text(
              'จำลองระบบใหม่ เหลือแค่เจ้าของ',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 13),
            ),
            const SizedBox(height: 20),

            // ปุ่ม Reset All
            FilledButton(
              onPressed: _isResetting ? null : _showResetDialog,
              style: FilledButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFFD80000),
                minimumSize: const Size(150, 40),
              ),
              child: _isResetting
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                    )
                  : const Text('Reset All'),
            ),
            const SizedBox(height: 20),

            // ปุ่ม Generate Tickets
            _isLoading
                ? const CircularProgressIndicator()
                : FilledButton(
                    onPressed: generateTickets,
                    style: FilledButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 216, 122, 0),
                      minimumSize: const Size(150, 40),
                    ),
                    child: const Text('เพิ่มลอตโต'),
                  ),
            const SizedBox(height: 50),

            // ปุ่ม Log Out
            FilledButton(
              onPressed: () {
                UserSession().currentUser = null;
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false,
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.black, width: 4),
                minimumSize: const Size(250, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text(
                'Log Out',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ฟังก์ชันแสดง Dialog ยืนยันก่อน Reset
  void _showResetDialog() {
    final TextEditingController _adminCodeController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('ยืนยันการลบข้อมูลระบบทั้งหมด', style: TextStyle(color: Colors.red)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('กรุณากรอกรหัสยืนยัน admin'),
            const SizedBox(height: 10),
            TextField(
              controller: _adminCodeController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'รหัสยืนยัน',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(backgroundColor: Colors.grey, foregroundColor: Colors.white),
            child: const Text('ยกเลิก'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _resetSystem(_adminCodeController.text.trim());
            },
            style: TextButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            child: const Text('ยืนยันการลบ'),
          ),
        ],
      ),
    );
  }

  // ฟังก์ชัน Reset System
  Future<void> _resetSystem(String adminCode) async {
    if (_isResetting) return;

    final user = UserSession().currentUser;
    if (user == null || (user.role?.toLowerCase() != 'admin')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('คุณไม่มีสิทธิ์ทำรายการนี้')),
      );
      return;
    }

    if (adminCode.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('กรุณากรอกรหัสยืนยัน')),
      );
      return;
    }

    setState(() => _isResetting = true);

    try {
      final res = await http.post(
        Uri.parse(ApiEndpoints.resetSystem),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'adminUserId': user.userId, 'adminCode': adminCode, 'confirm': true}),
      );

      final msg = _extractMessage(res.body) ?? 'รีเซ็ตระบบสำเร็จ';

      if (res.statusCode >= 200 && res.statusCode < 300) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ล้มเหลว: ${res.statusCode} - $msg')),
        );
      }
    } catch (e) {
      log('Reset system error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('เชื่อมต่อเซิร์ฟเวอร์ไม่ได้: $e')),
      );
    } finally {
      if (mounted) setState(() => _isResetting = false);
    }
  }

  String? _extractMessage(String body) {
    try {
      final j = jsonDecode(body);
      return (j['message'] ?? j['error'] ?? j['detail'] ?? j['status'])?.toString();
    } catch (_) {
      return null;
    }
  }

  // ฟังก์ชัน generate tickets
  void generateTickets() async {
    final adminId = UserSession().currentUser?.userId;
    if (adminId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not find user information. Please log in again.')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await http.post(
        Uri.parse(ApiEndpoints.generateTickets),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'adminUserId': adminId, 'count': 100, 'price': 80.0}),
      );

      if (!mounted) return;

      final responseData = jsonDecode(response.body);
      final String message = responseData['message'] ?? 'An unknown error occurred.';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
      log('Generate tickets error: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not connect to the server.')),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}
