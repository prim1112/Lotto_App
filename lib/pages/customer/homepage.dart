import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lotto_application/config/api_endpoints.dart';
import 'package:lotto_application/pages/customer/WidgetBar.dart';
import 'package:lotto_application/pages/customer/myappbar.dart';
import 'package:lotto_application/pages/customer/customer_bill.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // ตัวแปรเก็บผลรางวัลล่าสุด
  String _firstPrize = 'Loading...';
  String _secondPrize = 'Loading...';
  String _thirdPrize = 'Loading...';
  String _threeDigitPrize = '...';
  String _twoDigitPrize = '..';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchLatestResults(); // เรียก API เมื่อเปิดหน้า
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB6DFF0),
      appBar: MyAppbar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: 340,
              height: 400,
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
                          // รางวัลที่ 1
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
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

                          // รางวัลที่ 2 และ 3
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

                          // รางวัลเลขท้าย
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
                          const Spacer(),

                          // ปุ่มตรวจรางวัล
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyTicketsPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFFF59D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              child: Text(
                                'ตรวจรางวัล',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Loading overlay
                    if (_isLoading)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Widgetbar(selectedIndex: 0),
    );
  }

  // ฟังก์ชันดึงรางวัลล่าสุดจาก API
  Future<void> _fetchLatestResults() async {
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
      log("Fetch results error in Homepage: $e");
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
}
