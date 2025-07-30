import 'package:flutter/material.dart';
import 'package:lotto_application/pages/owner/Owner_reset.dart';

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
      backgroundColor: const Color(0xFFE1F5FE),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: TextButton(
            onPressed: () => Edit(context),
            child: Image.asset('assets/images/profile.png', width: 30),
          ),
        ),
      ],
    );
  }

  void Edit(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditPage()),
    );
  }
}
