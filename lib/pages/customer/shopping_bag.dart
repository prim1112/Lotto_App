import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lotto_application/pages/customer/WidgetBar.dart';
import 'package:lotto_application/pages/profile/profile.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPage();
}

class _ShoppingPage extends State<ShoppingPage> {
  Widgetbar widgetbar = Widgetbar();
  @override
  Widget build(BuildContext context) {
    Widget currenWidget = Container();
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
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Card(
                elevation: 4, // เพิ่มเงาให้กับ Card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // โค้งมุมของ Card
                ),
                margin: const EdgeInsets.all(8.0), // ขนาดของ margin
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 60,
                            height: 75,
                            child: Image.asset(
                              'assets/images/Screenshot (1726).png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
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
                                Row(
                                  children: [
                                    Text(
                                      'งวดวันที่ ',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xFF1A237E),
                                      ),
                                    ),
                                    Text(
                                      '1 สิงหาคม 2567',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  width: double.infinity,
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 5.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
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
                          GestureDetector(
                            onTap: () {
                              // Functionality for the basket button
                            },
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
