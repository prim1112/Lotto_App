import 'package:flutter/material.dart';
import 'package:lotto_application/pages/customer/WidgetBar.dart';
import 'package:lotto_application/pages/customer/myappbar.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPage();
}

class _ShoppingPage extends State<ShoppingPage> {
  Widgetbar widgetbar = Widgetbar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB6DFF0),
      appBar: MyAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        width: 40,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'กรุณาใส่เลขสลากของคุณ',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(left: 10, right: 5),
                              child: Icon(Icons.search, color: Colors.black),
                            ),
                            prefixIconConstraints: BoxConstraints(
                              minWidth: 40,
                              minHeight: 40,
                            ),
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
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 60, height: 75),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'สลากกินแบ่ง',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF1A237E),
                                  ),
                                ),

                                const SizedBox(height: 8),
                                Container(
                                  width: double.infinity,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFF59D),
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
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '100',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffFF8FB8),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'บาท',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // >>> แสดง popup ตอนกดตะกร้า
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(
                                          'ยืนยันการซื้อลอตเตอร์รี่เลข',
                                          style: TextStyle(
                                            color: Color(0xFFFF0000),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        content: const Text(
                                          '111111',
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
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
                                                  backgroundColor: const Color(
                                                    0xFFFFEB85,
                                                  ),
                                                  minimumSize: const Size(
                                                    100,
                                                    40,
                                                  ),
                                                ),
                                                child: const Text("ย้อนกลับ"),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  // 👉 ถ้ามีฟังก์ชันยืนยันให้เพิ่มตรงนี้
                                                },
                                                style: TextButton.styleFrom(
                                                  foregroundColor: Colors.black,
                                                  backgroundColor: const Color(
                                                    0xFF85FF96,
                                                  ),
                                                  minimumSize: const Size(
                                                    100,
                                                    40,
                                                  ),
                                                ),
                                                child: const Text("ยืนยัน"),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  );
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
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 60, height: 75),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'สลากกินแบ่ง',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF1A237E),
                                  ),
                                ),

                                const SizedBox(height: 8),
                                Container(
                                  width: double.infinity,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFF59D),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    '222222',
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
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '100',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffFF8FB8),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'บาท',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // >>> แสดง popup ตอนกดตะกร้า
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(
                                          'ยืนยันการซื้อลอตเตอร์รี่เลข',
                                          style: TextStyle(
                                            color: Color(0xFFFF0000),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        content: const Text(
                                          '222222',
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
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
                                                  backgroundColor: const Color(
                                                    0xFFFFEB85,
                                                  ),
                                                  minimumSize: const Size(
                                                    100,
                                                    40,
                                                  ),
                                                ),
                                                child: const Text("ย้อนกลับ"),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  // 👉 ถ้ามีฟังก์ชันยืนยันให้เพิ่มตรงนี้
                                                },
                                                style: TextButton.styleFrom(
                                                  foregroundColor: Colors.black,
                                                  backgroundColor: const Color(
                                                    0xFF85FF96,
                                                  ),
                                                  minimumSize: const Size(
                                                    100,
                                                    40,
                                                  ),
                                                ),
                                                child: const Text("ยืนยัน"),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  );
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
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 60, height: 75),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'สลากกินแบ่ง',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF1A237E),
                                  ),
                                ),

                                const SizedBox(height: 8),
                                Container(
                                  width: double.infinity,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFF59D),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    '333333',
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
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '100',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffFF8FB8),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'บาท',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // >>> แสดง popup ตอนกดตะกร้า
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(
                                          'ยืนยันการซื้อลอตเตอร์รี่เลข',
                                          style: TextStyle(
                                            color: Color(0xFFFF0000),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        content: const Text(
                                          '333333',
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
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
                                                  backgroundColor: const Color(
                                                    0xFFFFEB85,
                                                  ),
                                                  minimumSize: const Size(
                                                    100,
                                                    40,
                                                  ),
                                                ),
                                                child: const Text("ย้อนกลับ"),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  // 👉 ถ้ามีฟังก์ชันยืนยันให้เพิ่มตรงนี้
                                                },
                                                style: TextButton.styleFrom(
                                                  foregroundColor: Colors.black,
                                                  backgroundColor: const Color(
                                                    0xFF85FF96,
                                                  ),
                                                  minimumSize: const Size(
                                                    100,
                                                    40,
                                                  ),
                                                ),
                                                child: const Text("ยืนยัน"),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  );
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
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: widgetbar,
    );
  }
}
