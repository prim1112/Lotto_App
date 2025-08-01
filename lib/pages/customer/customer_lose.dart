import 'package:flutter/material.dart';
import 'package:lotto_application/pages/customer/customer_bill.dart';
import 'package:lotto_application/pages/profile/profile.dart';

class LosePage extends StatefulWidget {
  const LosePage({super.key});

  @override
  State<LosePage> createState() => _LosePageState();
}

class _LosePageState extends State<LosePage> {
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
              height: 560,
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
                          'assets/images/lose.jpg',
                          width: 340,
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
                      Text(
                        'ไม่ถูกรางวัล',
                        style: TextStyle(
                          color: Color.fromARGB(255, 230, 42, 42),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 155),
                      ElevatedButton(
                        style: FilledButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Color(0xFFFFF59D),
                          minimumSize: Size(100, 40),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BillPage()),
                          );
                        },
                        child: Text('ย้อนกลับ', style: TextStyle(fontSize: 14)),
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
