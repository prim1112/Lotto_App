// wallet_page.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:lotto_application/config/config.dart';
import 'package:lotto_application/model/Request/topup_request.dart';
import 'package:lotto_application/model/response/topup_response.dart';
import 'package:lotto_application/model/response/login_response_model.dart';
import 'package:lotto_application/services/user_session.dart';
import 'package:lotto_application/pages/customer/WidgetBar.dart';
import 'package:lotto_application/pages/customer/myappbar.dart';
import 'customer_win.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  TextEditingController amountController = TextEditingController();
  double balanceText = 0.0;

  User? get currentUser => UserSession().currentUser;

  @override
  void initState() {
    super.initState();
    final user = currentUser;
    if (user != null) balanceText = user.walletBalance;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadBalance();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB6DFF0),
      appBar: MyAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '฿ ${balanceText.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Color(0xFF1A237E),
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: showTopUpDialog,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFF34A7D6),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        side: const BorderSide(color: Colors.black, width: 1),
                      ),
                      child: const Text('เติมเงิน'),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 20, 20),
                child: Text('ยอดเงินคงเหลือ', style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: openWinPage,
                  child: const Text('เปิดหน้า WinPage'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Widgetbar(selectedIndex: 0),
    );
  }

  // ฟังก์ชันเปิด WinPage
  void openWinPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => WinPage(
          ticketNumber: '123456',
          prizeName: 'รางวัลที่ 1',
          reward: 1000000,
          drawDate: '16 ก.ย. 2568',
          drawDateIso: '2025-09-16',
          onClaimed: () async {
            await loadBalance(); // รีโหลดยอดเงิน
          },
        ),
      ),
    );

    // ถ้าปิด WinPage โดยสำเร็จ
    if (result == true) await loadBalance();
  }

  // โหลดยอดเงินจาก API
  Future<void> loadBalance() async {
    final user = currentUser;
    if (user == null) return;

    try {
      final apiUrl = await Configuration.getConfig().then((v) => v["apiEndpoint"]);
      final response = await http.get(Uri.parse('$apiUrl/wallet/${user.userId}'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final newBalance = double.tryParse(data['balance'].toString()) ?? 0.0;
        setState(() {
          balanceText = newBalance;
          currentUser!.walletBalance = newBalance;
        });
      }
    } catch (e) {
      print('Error loading balance: $e');
    }
  }

  // เติมเงิน
  void showTopUpDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          content: SizedBox(
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('จำนวนเงิน', style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: amountController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        style: const TextStyle(fontSize: 20),
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text('บาท', style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('ขั้นต่ำ 100 บาท', style: TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: addWallet,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF85FF96),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    ),
                    child: const Text('ยืนยัน', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> addWallet() async {
    final user = currentUser;
    if (user == null) return;

    double amount = double.tryParse(amountController.text.trim()) ?? 0.0;
    if (amount < 100) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('ขั้นต่ำ 100 บาท')));
      return;
    }

    try {
      final apiUrl = await Configuration.getConfig().then((v) => v["apiEndpoint"]);
      final topupRequest = TopupRequest(userId: user.userId, amount: amount);
      final jsonData = topupRequestToJson(topupRequest);

      final response = await http.post(
        Uri.parse('$apiUrl/wallet/topup'),
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: jsonData,
      );

      if (response.statusCode == 200) {
        final topupResponse = topupResponseFromJson(response.body);
        setState(() {
          balanceText = topupResponse.newBalance;
          currentUser!.walletBalance = topupResponse.newBalance;
        });
        Navigator.of(context).pop(); // ปิด dialog
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('เกิดข้อผิดพลาด: $e')));
    }

    await loadBalance();
  }
}
