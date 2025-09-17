import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lotto_application/config/config.dart';
import 'package:lotto_application/model/response/login_response_model.dart';
import 'package:lotto_application/model/response/lottoticket_response_model.dart';
import 'package:lotto_application/pages/customer/WidgetBar.dart';
import 'package:lotto_application/pages/customer/myappbar.dart';
import 'package:lotto_application/services/user_session.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  Widgetbar widgetbar = Widgetbar();
  List<LottoticketResponse> lottoticket = [];
  late Future<void> loadData;
  TextEditingController searchController = TextEditingController();
  LoginResponse? loginResponse;

  @override
  void initState() {
    super.initState();
    loadData = loadDataAsync();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB6DFF0),
      // appBar: MyAppbar(),
      appBar: AppBar(
        title: Text(
          UserSession().currentUser != null
              ? 'สวัสดี, ${UserSession().currentUser!.username}'
              : 'กำลังโหลด...',
        ),
      ),

      bottomNavigationBar: widgetbar,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            SizedBox(
              height: 40,
              child: TextField(
                controller: searchController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'กรุณาใส่เลขสลากของคุณ',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  setState(() {}); // รีเฟรช list ตาม search
                },
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: filteredTickets
                      .map(
                        (lotto) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Card(
                            margin: const EdgeInsets.symmetric(horizontal: 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 70),
                                    child: Text(
                                      'สลากกินแบ่ง',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.blue.shade900,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),

                                  // เลขสลาก
                                  Padding(
                                    padding: const EdgeInsets.only(left: 70),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFFF59D),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                      child: Text(
                                        lotto.ticketNumber,
                                        style: const TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),

                                  // ราคาและปุ่มตะกร้า
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${lotto.price} บาท',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFFF8FB8),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // popup ยืนยันซื้อสลาก
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: const Text(
                                                'ยืนยันการซื้อลอตเตอร์รี่เลข',
                                                style: TextStyle(
                                                  color: Color(0xFFFF0000),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              content: Text(
                                                lotto.ticketNumber,
                                                style: const TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () => Navigator.of(
                                                    context,
                                                  ).pop(),
                                                  style: TextButton.styleFrom(
                                                    foregroundColor:
                                                        Colors.black,
                                                    backgroundColor:
                                                        const Color(0xFFFFEB85),
                                                    minimumSize: const Size(
                                                      100,
                                                      40,
                                                    ),
                                                  ),
                                                  child: const Text('ย้อนกลับ'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    // เพิ่มฟังก์ชันยืนยันซื้อ
                                                  },
                                                  style: TextButton.styleFrom(
                                                    foregroundColor:
                                                        Colors.black,
                                                    backgroundColor:
                                                        const Color(0xFF85FF96),
                                                    minimumSize: const Size(
                                                      100,
                                                      40,
                                                    ),
                                                  ),
                                                  child: const Text('ยืนยัน'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: const Color(0xFF36C5F4),
                                              width: 2,
                                            ),
                                          ),
                                          padding: const EdgeInsets.all(8),
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
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
<<<<<<< Updated upstream
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
                                Row(
                                  children: const [
                                    Text(
                                      'งวดวันที่ ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF1A237E),
                                      ),
                                    ),
                                    Text(
                                      '1 สิงหาคม 2567',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
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
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
=======
            ),
          ],
>>>>>>> Stashed changes
        ),
      ),
    );
  }

  Future<void> loadDataAsync() async {
    var value = await Configuration.getConfig();
    String url = value['apiEndpoint'];

    try {
      final response = await http.get(Uri.parse('$url/admin/tickets'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        lottoticket = List<LottoticketResponse>.from(
          jsonData.map((x) => LottoticketResponse.fromJson(x)),
        );
        setState(() {});
      } else {
        throw Exception('Failed to load tickets');
      }
    } catch (e) {
      print('Error loading tickets: $e');
      throw e;
    }
  }

  List<LottoticketResponse> get filteredTickets {
    var availableTickets = lottoticket
        .where((ticket) => ticket.status == "available")
        .toList();
    if (searchController.text.isEmpty) return availableTickets;
    return availableTickets
        .where(
          (ticket) =>
              ticket.ticketNumber.contains(searchController.text.trim()),
        )
        .toList();
  }
}
