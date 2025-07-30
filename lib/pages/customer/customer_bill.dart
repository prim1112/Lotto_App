import 'package:flutter/material.dart';
import 'package:lotto_application/pages/customer/WidgetBar.dart';
import 'package:lotto_application/pages/customer/customer_lose.dart';
import 'package:lotto_application/pages/customer/customer_win.dart';
import 'package:lotto_application/pages/profile/profile.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  State<BillPage> createState() => _BillPage();
}

class _BillPage extends State<BillPage> {
  Widgetbar widgetbar = Widgetbar();
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
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Label above the container
          const Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Text(
              'สลากกินแบ่งทั้งหมดของคุณ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          _buildInfoCard(context),
        ],
      ),
      bottomNavigationBar: widgetbar,
    );
  }

  Widget _buildInfoCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _isWinning() ? WinPage() : LosePage(),
            ),
          );
        },
        child: Container(
          width: 320,
          height: 170,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 1),
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
                            Row(
                              children: [
                                const Text(
                                  'สลากกินแบ่ง',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1A237E),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  _isWinning() ? 'ถูกรางวัล' : 'ไม่ถูกรางวัล',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: _isWinning()
                                        ? Colors.pink
                                        : Colors.grey,
                                  ),
                                ),
                              ],
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
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'งวดวันที่\n',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFF1A237E),
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '1 สิงหาคม 2567',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
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
                            style: TextStyle(fontSize: 8, color: Colors.black),
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
    );
  }

  // Dummy function to determine if it's a winning ticket
  bool _isWinning() {
    // Replace this with actual logic to determine if the ticket is a winning one
    return false; // Change to true to test the winning condition
  }

  void Edit(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage()),
    );
  }
}
