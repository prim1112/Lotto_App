import 'package:flutter/material.dart';
import 'package:lotto_application/pages/customer/WidgetBar.dart';
import 'package:lotto_application/pages/customer/customer_bill.dart';
import 'package:lotto_application/pages/customer/myappbar.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    Widgetbar widgetbar = Widgetbar();
    return Scaffold(
      backgroundColor: const Color(0xFFB6DFF0),
      appBar: MyAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ชื่อผู้ใช้ที่มุมบนซ้าย

          // ส่วนของการ์ด
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
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
                            const SizedBox(height: 20),
                            // รางวัลที่ 2 และ 3
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'รางวัล 5,000,000 บาท',
                                      style: TextStyle(fontSize: 10),
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'รางวัล 1,000,000 บาท',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            // รางวัลเลขท้าย
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'รางวัล 500,000 บาท',
                                      style: TextStyle(fontSize: 10),
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'รางวัล 100,000 บาท',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
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
                                  'ตรวจรางวัล',
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
              ),
            ),
          ),

          // ชื่อผู้ใช้ที่มุมบนซ้าย (ใช้ Positioned)
        ],
      ),
      bottomNavigationBar: widgetbar,
    );
  }
}
