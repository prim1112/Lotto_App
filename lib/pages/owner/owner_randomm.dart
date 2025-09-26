import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lotto_application/config/api_endpoints.dart';
import 'package:lotto_application/pages/owner/Owner_reset.dart';
import 'package:lotto_application/pages/owner/ownerNavbar.dart';
import 'package:lotto_application/services/user_session.dart';

class RandomPage extends StatefulWidget {
  const RandomPage({super.key});

  @override
  State<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  int _selectedIndex = 0;
  bool _isLoading = false;

  String _firstPrize = 'Loading...';
  String _secondPrize = 'Loading...';
  String _thirdPrize = 'Loading...';
  String _threeDigitPrize = '...';
  String _twoDigitPrize = '..';

  @override
  void initState() {
    super.initState();
    _fetchLatestResults();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB6DFF0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          'สุ่มรางวัลที่ออก',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditPage()),
              ),
              child: Image.asset('assets/images/profile.png', width: 30),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: 340,
              height: 480,
              child: Card(
                color: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'รางวัลที่ 1',
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                _firstPrize,
                                style: const TextStyle(
                                  color: Color(0xFF1A237E),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'รางวัล 10,000,000 บาท',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    'รางวัลที่ 2',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    _secondPrize,
                                    style: const TextStyle(
                                      color: Color(0xFF1A237E),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    'รางวัล 5,000,000 บาท',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'รางวัลที่ 3',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    _thirdPrize,
                                    style: const TextStyle(
                                      color: Color(0xFF1A237E),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    'รางวัล 1,000,000 บาท',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    'รางวัลเลขท้าย 3 ตัว',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    _threeDigitPrize,
                                    style: const TextStyle(
                                      color: Color(0xFF1A237E),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    'รางวัล 500,000 บาท',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'รางวัลเลขท้าย 2 ตัว',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    _twoDigitPrize,
                                    style: const TextStyle(
                                      color: Color(0xFF1A237E),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    'รางวัล 100,000 บาท',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () =>
                                      _showConfirmationDialog('sold'),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: const Color(0xFFFFF59D),
                                    minimumSize: const Size(
                                      double.infinity,
                                      45,
                                    ),
                                  ),
                                  child: const Text('ลอตโต้ที่ขายไปแล้ว'),
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () =>
                                      _showConfirmationDialog('all'),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: const Color(0xFFFFF59D),
                                    minimumSize: const Size(
                                      double.infinity,
                                      45,
                                    ),
                                  ),
                                  child: const Text('ลอตโต้ทั้งหมด'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (_isLoading)
                      Container(
                        color: Colors.black.withOpacity(0.5),
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        screenSize: MediaQuery.of(context).size,
      ),
    );
  }

  // ออกรางวัลจากที่ขายไปแล้ว
  void _showConfirmationDialog(String drawType) {
    String title = drawType == 'sold' ? 'ลอตโต้ที่ขายไปแล้ว' : 'ลอตโต้ทั้งหมด';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'ยืนยันการสุ่มรางวัล',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          content: Text('คุณต้องการสุ่มรางวัลจาก "$title" ใช่หรือไม่?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("ย้อนกลับ"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _drawTickets(drawType);
              },
              child: const Text("ยืนยัน"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _fetchLatestResults() async {
    //ฟังก์ดึงผลรางวัลมาแสดง
    setState(() => _isLoading = true);
    try {
      final response = await http.get(Uri.parse(ApiEndpoints.getLatestResults));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _firstPrize = data['prize1_number'];
          _secondPrize = data['prize2_number'];
          _thirdPrize = data['prize3_number'];
          _threeDigitPrize = data['last3_number'];
          _twoDigitPrize = data['last2_number'];
        });
      } else {
        setState(() {
          _firstPrize = 'ยังไม่มีผล';
          _secondPrize = 'ยังไม่มีผล';
          _thirdPrize = 'ยังไม่มีผล';
          _threeDigitPrize = 'N/A';
          _twoDigitPrize = 'N/A';
        });
      }
    } catch (e) {
      log("Fetch results error: $e");
      setState(() {
        _firstPrize = 'Error';
        _secondPrize = 'Error';
        _thirdPrize = 'Error';
        _threeDigitPrize = 'Err';
        _twoDigitPrize = 'Err';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _drawTickets(String drawType) async {
    setState(() => _isLoading = true);
    final adminId = UserSession().currentUser?.userId;
    if (adminId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ไม่พบข้อมูลผู้ใช้ กรุณาล็อกอินใหม่')),
      );
      setState(() => _isLoading = false);
      return;
    }
    try {
      final response = await http.post(
        Uri.parse(ApiEndpoints.drawTickets),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'adminUserId': adminId, 'drawType': drawType}),
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(responseData['message'] ?? 'สุ่มรางวัลสำเร็จ!'),
          ),
        );
        _fetchLatestResults();
      } else {
        final errorData = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('เกิดข้อผิดพลาด: ${errorData['message']}')),
        );
      }
    } catch (e) {
      log('Draw tickets error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ไม่สามารถเชื่อมต่อกับเซิร์ฟเวอร์ได้')),
      );
    } finally {
      // Let _fetchLatestResults handle the final isLoading = false
    }
  }
}
