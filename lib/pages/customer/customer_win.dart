import 'package:flutter/material.dart';
import 'package:lotto_application/pages/profile/profile.dart';

class WinPage extends StatefulWidget {
  const WinPage({super.key});

  @override
  State<WinPage> createState() => _WinPageState();
}

class _WinPageState extends State<WinPage> {
  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFE1F5FE),
      appBar: AppBar(
        backgroundColor: Color(0xFFE1F5FE),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
                child: SizedBox(
                  width: 140,
                  child: Image.asset(
                    'assets/images/Screenshot (1724).png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: TextButton(
                  onPressed: () => Edit(context),
                  child: Image.asset(
                    'assets/images/5.png',
                    fit: BoxFit.contain,
                    width: 50,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Center(
            child: Container(
              width: 340,
              child: Card(
                color: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.black, width: 1.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/happy.jpg',
                          width: 350,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              '999999',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'งวดที่ 1 สิงหาคม 2567',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'ถูกเลขรางวัลที่ 1',
                              style: TextStyle(
                                color: Color(0xFF01579B),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'จำนวน 1 ใบ',
                              style: TextStyle(
                                color: Color(0xFF01579B),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('เงินรางวัล', style: TextStyle(fontSize: 12)),
                            Text(
                              '10,000,000',
                              style: TextStyle(
                                color: Color(0xFF01579B),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('บาท', style: TextStyle(fontSize: 12)),
                          ],
                        ),
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
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Center(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                    8.0,
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        'คุณได้รับเงินรางวัล',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      Text(
                                                        'จำนวน',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      Text(
                                                        '10,000,00',
                                                        style: TextStyle(
                                                          color: Color(
                                                            0xFF01579B,
                                                          ),
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        'บาท',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  'เมื่อกดยืนยันเงินรางวัลของคุณจะถูกโอนเข้า',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                Text(
                                                  'วอเล็ตของคุณโดยอัตโนมัติ',
                                                  style: TextStyle(
                                                    fontSize: 12,
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
                                                backgroundColor: Color(
                                                  0xFFFFF59D,
                                                ),
                                                minimumSize: Size(100, 40),
                                              ),
                                              child: Text("ย้อนกลับ"),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              style: TextButton.styleFrom(
                                                foregroundColor: Colors.black,
                                                backgroundColor: Color(
                                                  0xFF00E676,
                                                ),
                                                minimumSize: Size(100, 40),
                                              ),
                                              child: Text("ยืนยัน"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: const Color.fromARGB(
                                  255,
                                  0,
                                  0,
                                  0,
                                ),
                                backgroundColor: Color(0xFFFFF59D),
                                minimumSize: Size(100, 40),
                              ),
                              child: Text('ขึ้นเงินรางวัล'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void Edit(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
  }
}
