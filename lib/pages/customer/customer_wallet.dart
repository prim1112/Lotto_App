import 'package:flutter/material.dart';
import 'package:lotto_application/pages/customer/WidgetBar.dart';
import 'package:lotto_application/pages/customer/customer_top-up.dart';
import 'package:lotto_application/pages/profile/profile.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  Widgetbar widgetbar = const Widgetbar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1F5FE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE1F5FE),
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
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 30, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '฿ 2000',
                      style: TextStyle(
                        color: Color(0xFF1A237E),
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TopupPage(),
                          ),
                        );
                      },
                      child: const Text('เติมเงิน'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color.fromARGB(
                          255,
                          255,
                          255,
                          255,
                        ),
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        side: const BorderSide(color: Colors.black, width: 1),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 20, 20),
                child: Text('ยอดเงินคงเหลือ', style: TextStyle(fontSize: 16)),
              ),
              SizedBox(
                width: double.infinity,
                height: 800,
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.black, width: 1.5),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(60, 10, 20, 0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'งวดที่',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF1A237E),
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Text(
                                          '1 สิงหาคม 2567',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 150,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFFFF59D),
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '100',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                              255,
                                              255,
                                              186,
                                              186,
                                            ),
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
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text(
                                    'ยอดรวม',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  '200 ',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 106, 191),
                                  ),
                                ),
                                Text(
                                  'บาท',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color.fromARGB(255, 255, 111, 100),
                      minimumSize: const Size(100, 40),
                      side: const BorderSide(color: Colors.black, width: 1),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'ยกเลิก',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xFFB9FBC0),
                      minimumSize: const Size(100, 40),
                      side: const BorderSide(color: Colors.black, width: 1),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'ชำระเงิน',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
