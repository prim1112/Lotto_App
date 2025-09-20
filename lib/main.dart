import 'package:flutter/material.dart';
<<<<<<< Updated upstream
=======
import 'package:lotto_application/pages/customer/homepage.dart';
>>>>>>> Stashed changes
import 'package:lotto_application/pages/customer/shopping_bag.dart';
import 'package:lotto_application/pages/login.dart';
import 'package:lotto_application/pages/owner/Owner_draw.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
<<<<<<< Updated upstream

      home: ShoppingPage(),
=======
      home: ShoppingPage(), //เปิดหน้า Login
>>>>>>> Stashed changes
    );
  }
}
