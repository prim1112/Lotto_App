import 'package:flutter/material.dart';
import 'package:lotto_application/pages/owner/Owner_reset.dart';
import 'package:lotto_application/pages/owner/ownerNavbar.dart';

class RandomPage extends StatefulWidget {
  const RandomPage({super.key});

  @override
  State<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB6DFF0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditPage()),
                );
              },
              child: Image.asset('assets/images/profile.png', width: 30),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 0, 30),
              child: SizedBox(
                width: 340,
                height: 400,
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('รางวัลที่ 1', style: TextStyle(fontSize: 12)),
                            Text(
                              '999999',
                              style: TextStyle(
                                color: Color(0xFF1A237E),
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'รางวัล 10,000,000 บาท',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'รางวัลที่ 2',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text(
                                          '888888',
                                          style: TextStyle(
                                            color: Color(0xFF1A237E),
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'รางวัล 5,000,000 บาท',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'รางวัลที่ 3',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text(
                                          '777777',
                                          style: TextStyle(
                                            color: Color(0xFF1A237E),
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'รางวัล 1,000,000 บาท',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'รางวัลเลขท้าย 3 ตัว',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text(
                                          '888',
                                          style: TextStyle(
                                            color: Color(0xFF1A237E),
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'รางวัล 500,000 บาท',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'รางวัลเลขท้าย 2 ตัว',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text(
                                          '55',
                                          style: TextStyle(
                                            color: Color(0xFF1A237E),
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'รางวัล 100,000 บาท',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                        'ยืนยันการสุ่ม',
                                        style: TextStyle(
                                          color: Color(0xFFFF0000),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      content: const Text('ลอตโต้ที่ขายไปแล้ว'),
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
                                                backgroundColor: const Color(
                                                  0xFFFFEB85,
                                                ),
                                                minimumSize: const Size(
                                                  100,
                                                  40,
                                                ),
                                              ),
                                              child: const Text("ย้อนกลับ"),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              style: TextButton.styleFrom(
                                                foregroundColor: Colors.black,
                                                backgroundColor: const Color(
                                                  0xFF85FF96,
                                                ),
                                                minimumSize: const Size(
                                                  100,
                                                  40,
                                                ),
                                              ),
                                              child: const Text("ยืนยัน"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: const Color(0xFFFFF59D),
                                minimumSize: const Size(100, 40),
                              ),
                              child: const Text('ลอตโต้ที่ขายไปแล้ว'),
                            ),

                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                        'ยืนยันการสุ่ม',
                                        style: TextStyle(
                                          color: Color(0xFFFF0000),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      content: const Text('ลอตโต้ทั้งหมด'),
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
                                                backgroundColor: const Color(
                                                  0xFFFFEB85,
                                                ),
                                                minimumSize: const Size(
                                                  100,
                                                  40,
                                                ),
                                              ),
                                              child: const Text("ย้อนกลับ"),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              style: TextButton.styleFrom(
                                                foregroundColor: Colors.black,
                                                backgroundColor: const Color(
                                                  0xFF85FF96,
                                                ),
                                                minimumSize: const Size(
                                                  100,
                                                  40,
                                                ),
                                              ),
                                              child: const Text("ยืนยัน"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: const Color(0xFFFFF59D),
                                minimumSize: const Size(100, 40),
                              ),
                              child: const Text('ลอตโต้ทั้งหมด'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex, // ตัวแปรเก็บตำแหน่งของปุ่มที่เลือก
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index; // อัปเดตตำแหน่งของปุ่มที่เลือก
          });
        },
        screenSize: MediaQuery.of(context).size, // ขนาดหน้าจอปัจจุบัน
      ),
    );
  }
}
