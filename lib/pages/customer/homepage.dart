import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lotto_application/pages/customer/WidgetBar.dart';
import 'package:lotto_application/pages/customer/customer_bill.dart';
import 'package:lotto_application/pages/profile/profile.dart';

class Homepage extends StatefulWidget {
  int customer_id = 0;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    Widgetbar widgetbar = Widgetbar();
    Widget currenWidget = Container();
    final screensize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFE1F5FE),
      appBar: AppBar(
        backgroundColor: Color(0xff71B1F2),
        title: Text(
          'เข้าสู่ระบบ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        controller: null,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 0, bottom: 10, left: 20),
                  child: Text(
                    '1 สิงหาคม 2567',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                width: 320,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // ข้อมูลรางวัล
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
                        const Spacer(), // ใช้ Spacer เพื่อให้ปุ่มอยู่ที่ด้านล่างสุด
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BillPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(
                              0xFFFFF59D,
                            ), // กำหนดสีของปุ่ม
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
                              'ตรวจฉลากฯงวดนี้ เพิ่ม',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                width: 320,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SizedBox(
                              width: 60,
                              height: 75,
                              child: Image.asset(
                                'assets/images/Screenshot (1726).png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'สลากกินแบ่ง',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1A237E),
                                    ),
                                  ),
                                  RichText(
                                    text: const TextSpan(
                                      text: 'งวดวันที่ ',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xFF1A237E),
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '1 สิงหาคม 2567',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    width: 150,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFF59D),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      '111111',
                                      style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '100',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 186, 186),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'บาท',
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color.fromARGB(
                                    255,
                                    54,
                                    197,
                                    244,
                                  ),
                                  width: 3,
                                ),
                              ),
                              padding: const EdgeInsets.all(4),
                              child: SizedBox(
                                width: 30,
                                height: 20,
                                child: Image.asset(
                                  'assets/images/basket.png',
                                  fit: BoxFit.cover,
                                ),
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
          ],
        ),
      ),
      bottomNavigationBar: widgetbar,
    );
  }

  void Edit(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage()),
    );
  }
}
