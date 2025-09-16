import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lotto_application/config/api_endpoints.dart';
import 'package:lotto_application/pages/login.dart';
import 'package:lotto_application/pages/owner/Owner_draw.dart';
import 'package:lotto_application/services/user_session.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  bool _isLoading = false;
  // int _selectedIndex = 1;
  // String url = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1F5FE),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios), // ไอคอนลูกศรย้อนกลับ
          onPressed: () {
            Navigator.pop(context); // กลับไปยังหน้าจอก่อนหน้า
          },
        ),
        backgroundColor: const Color(0xFFE1F5FE),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 30, 0, 0),
              child: SizedBox(
                width: 90,
                height: 90,
                child: Image.asset('assets/images/proflie1.png'),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 10, 50),
                  child: Text(
                    'Admin',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 35,
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 10, 0),
                  child: Text(
                    'ลบข้อมูลระบบทั้งหมด',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                  child: Text(
                    'จำลองระบบใหม่ เหลือแค่เจ้าของ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: FilledButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "ยืนยันการลบ",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "ข้อมูลทั้งหมด",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      backgroundColor: const Color(0xFFD80000),
                                      minimumSize: const Size(100, 40),
                                    ),
                                    child: const Text("ยกเลิก"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      backgroundColor: const Color(0xFFFFEB85),
                                      minimumSize: const Size(100, 40),
                                    ),
                                    child: const Text("ยืนยันการลบ"),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFFD80000),
                      minimumSize: const Size(150, 40),
                    ),
                    child: const Text('Reset All'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Show a loading indicator if the process is running
                _isLoading
                    ? CircularProgressIndicator()
                    : FilledButton(
                        onPressed: generateTickets,
                        style: FilledButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromARGB(255, 216, 122, 0),
                          minimumSize: const Size(150, 40),
                        ),
                        child: const Text('เพิ่มลอตโต'),
                      ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 50, 10, 0),
                  child: FilledButton(
                    onPressed: () {
                      // Clear the session on logout
                      UserSession().currentUser = null;
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                        (route) => false, // Removes all previous routes
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.black, width: 4),
                      minimumSize: const Size(250, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void generateTickets() async {
    // 1. Get the adminId directly from the UserSession singleton.
    // The '?.userId' is a null-aware operator. It will be null if currentUser is null.
    final adminId = UserSession().currentUser?.userId;

    // 2. Add a check to ensure the adminId was found.
    // This is important in case the user session is somehow cleared.
    if (adminId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Could not find user information. Please log in again.',
          ),
        ),
      );
      return; // Stop the function if no adminId is found.
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse(ApiEndpoints.generateTickets),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          // 3. Use the adminId retrieved from the session.
          'adminUserId': adminId,
          'count': 100,
          'price': 80.00,
        }),
      );

      if (!mounted) return;

      final responseData = jsonDecode(response.body);
      final String message =
          responseData['message'] ?? 'An unknown error occurred.';

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
      log('Generate tickets error: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not connect to the server.')),
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
