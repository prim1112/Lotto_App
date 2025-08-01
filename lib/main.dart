import 'package:flutter/material.dart';
import 'package:lotto_application/pages/customer/customer_top-up.dart';
import 'package:lotto_application/pages/customer/homepage.dart';
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
      home: LoginPage(),
    );
  }
}
