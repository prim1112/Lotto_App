import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lotto_application/pages/customer/WidgetBar.dart';
import 'package:lotto_application/pages/customer/myappbar.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  State<BillPage> createState() => _BillPage();
}

class _BillPage extends State<BillPage> {
  Widgetbar widgetbar = Widgetbar();
  String myLotteryNumber = "000000"; // เลขที่มี
  String resultMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB6DFF0),
      appBar: MyAppbar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'สลากกินแบ่งทั้งหมดของคุณ',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 60, height: 75),
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
                                child: Text(
                                  myLotteryNumber,
                                  style: const TextStyle(
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
                          children: const [
                            Text(
                              '100',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffFF8FB8),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
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
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Color(0xFFFFF59D),
                                minimumSize: Size(90, 30),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: checkLottery,
                              child: const Text(
                                'ตรวจสลาก',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // แสดงผลการตรวจ
                    if (resultMessage.isNotEmpty)
                      Text(
                        resultMessage,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: widgetbar,
    );
  }

  Future<void> checkLottery() async {
    try {
      final response = await http.get(
        Uri.parse("https://my-lotto-api.onrender.com/api/results/latest"),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        String prize1 = data["prize1_number"];
        String prize2 = data["prize2_number"];
        String prize3 = data["prize3_number"];
        String last3 = data["last3_number"];
        String last2 = data["last2_number"];

        String message = "ไม่ถูกรางวัล";

        if (myLotteryNumber == prize1) {
          message = "🎉 ถูกรางวัลที่ 1";
        } else if (myLotteryNumber == prize2) {
          message = "🎉 ถูกรางวัลที่ 2";
        } else if (myLotteryNumber == prize3) {
          message = "🎉 ถูกรางวัลที่ 3";
        } else if (myLotteryNumber.endsWith(last3)) {
          message = "🎉 ถูกรางวัลเลขท้าย 3 ตัว";
        } else if (myLotteryNumber.endsWith(last2)) {
          message = "🎉 ถูกรางวัลเลขท้าย 2 ตัว";
        }

        setState(() {
          resultMessage = message;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("โหลดผลรางวัลไม่สำเร็จ")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("เกิดข้อผิดพลาด: $e")),
      );
    }
  }
}
