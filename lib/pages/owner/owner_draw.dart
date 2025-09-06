import 'package:flutter/material.dart';
import 'package:lotto_application/pages/owner/Owner_reset.dart';
import 'package:lotto_application/pages/owner/ownerNavbar.dart';

class OdrawPage extends StatefulWidget {
  const OdrawPage({super.key});

  @override
  State<OdrawPage> createState() => _OdrawPageState();
}

class _OdrawPageState extends State<OdrawPage> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB6DFF0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          'รางวัลที่ออก',
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
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // รางวัลที่ 1
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        screenSize: MediaQuery.of(context).size,
      ),
    );
  }
}
