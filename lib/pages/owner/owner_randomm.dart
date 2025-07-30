import 'dart:developer';

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
    final screensize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFE1F5FE),
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
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
                    child: Text(
                      '1 สิงหาคม 2567',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: SizedBox(
                  width: 340,
                  height: 380,
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
                              Text(
                                'รางวัลที่ 1',
                                style: TextStyle(fontSize: 12),
                              ),
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
                                            'รางวัลที่ 4',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                            '666666',
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
                                            'รางวัลที่ 5',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                            '555555',
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
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  style: FilledButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: const Color(0xFFFFF59D),
                                    minimumSize: const Size(90, 25),
                                  ),
                                  onPressed: () {
                                    log('all');
                                  },
                                  child: const Text(
                                    'ลอตโตที่ขายไปแล้ว',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: FilledButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: const Color(0xFFFFF59D),
                                    minimumSize: const Size(90, 25),
                                  ),
                                  onPressed: () {
                                    log('all');
                                  },
                                  child: const Text(
                                    'ลอตโตทั้งหมด',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
