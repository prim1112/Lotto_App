import 'package:flutter/material.dart';
import 'package:lotto_application/pages/login.dart';
import 'package:lotto_application/services/user_session.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  MyAppbar({
    Key? key,
    this.preferredSize = const Size.fromHeight(kToolbarHeight),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFB6DFF0),
      automaticallyImplyLeading: false,
      title:  Text(
          UserSession().currentUser != null
              ? '${UserSession().currentUser!.username}'
              : '',
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: IconButton(
            onPressed: () => logout(context),
            icon: const Icon(Icons.logout),
            iconSize: 30,
            color: Colors.black,
            tooltip: 'ออกจากระบบ',
          ),
        ),
      ],
    );
  }

  void logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
