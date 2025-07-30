import 'package:flutter/material.dart';
import 'package:lotto_application/pages/customer/customer_wallet.dart';
import 'package:lotto_application/pages/customer/myappbar.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({super.key});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  @override
  var phoneCtl = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1F5FE),
      appBar: MyAppbar(preferredSize: const Size.fromHeight(kToolbarHeight)),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(30, 30, 20, 0),
                      child: Text(
                        '฿ 2000',
                        style: TextStyle(
                          color: Color(0xFF1A237E),
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 20, 40),
                      child: Text(
                        'ยอดเงินคงเหลือ',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: SizedBox(
                        width: 300,
                        height: 230,
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: Colors.black,
                              width: 1.5,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 4),
                                    const Text(
                                      'จำนวนเงิน',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    const SizedBox(height: 15),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        5,
                                        0,
                                        20,
                                        0,
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              keyboardType: TextInputType.phone,
                                              controller: phoneCtl,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  borderSide: const BorderSide(
                                                    color: Colors.black,
                                                    width: 10,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          const Text(
                                            'บาท',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    const Row(
                                      children: [
                                        Text(
                                          'ขั้นต่ำ 100 บาท',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        0,
                                        0,
                                        0,
                                        0,
                                      ),
                                      child: ElevatedButton(
                                        style: FilledButton.styleFrom(
                                          foregroundColor: Colors.black,
                                          backgroundColor: const Color(
                                            0xFF00E676,
                                          ),
                                          minimumSize: const Size(80, 25),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const WalletPage(),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          'ยืนยัน',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: ElevatedButton(
                            style: FilledButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: const Color(0xFFFFF59D),
                              minimumSize: const Size(100, 30),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WalletPage(),
                                ),
                              );
                            },
                            child: const Text('ย้อนกลับ'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    //  BottomNavigationBar(
    //     items: const [
    //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    //       BottomNavigationBarItem(
    //           icon: Icon(Icons.settings), label: 'Settings'),
    //     ],
    //   );
  }
}
