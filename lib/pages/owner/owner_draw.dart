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
    final screensize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFE1F5FE),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
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
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
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
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
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
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
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
