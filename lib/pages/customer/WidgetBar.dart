import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lotto_application/pages/customer/customer_bill.dart';
import 'package:lotto_application/pages/customer/customer_wallet.dart';
import 'package:lotto_application/pages/customer/homepage.dart';
import 'package:lotto_application/pages/customer/shopping_bag.dart';

class Widgetbar extends StatefulWidget {
  const Widgetbar({super.key, required int selectedIndex});

  @override
  State<Widgetbar> createState() => _WidgetbarState();
}

class _WidgetbarState extends State<Widgetbar> {
  // UserProfile user = UserProfile();
  @override
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xFF1A237E), // Set background color
      selectedItemColor: Colors.white, // Color of the selected icon
      unselectedItemColor: Colors.white54, // Color of the unselected icon
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าหลัก'),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          label: 'หน้าสินค้า',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet_rounded),
          label: 'wallet',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long_outlined),
          label: 'ตรวจ',
        ),
      ],
      onTap: (value) {
        log(value.toString());
        setState(() {
          if (value == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
          }
          if (value == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ShoppingPage()),
            );
          }
          if (value == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const WalletPage()),
            );
          }
          if (value == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyTicketsPage()),
            );
          }
        });
      },
    );
  }
}
