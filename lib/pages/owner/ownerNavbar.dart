import 'package:flutter/material.dart';
import 'package:lotto_application/pages/owner/Owner_draw.dart';
import 'package:lotto_application/pages/owner/Owner_randomm.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;
  final Size screenSize;

  const CustomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.screenSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        height: 60,
        indicatorColor: const Color(0xFF1A237E),
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // ปรับเลขให้กลมพอดี
        ),
        labelTextStyle: WidgetStateProperty.all(
          TextStyle(
            color: Colors.white,
            fontSize: screenSize.width * 0.03,
            height: 1.2,
          ),
        ),
      ),

      child: NavigationBar(
        backgroundColor: const Color(0xFF16629F),
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          onDestinationSelected(index);
          switch (index) {
            case 0:
              navigateRandomPage(context);
              break;
            case 1:
              navigateOdrawPage(context);
              break;
          }
        },
        destinations: [
          NavigationDestination(
            icon: Image(
              image: const AssetImage("assets/images/random.png"),
              width: 25, // ลดขนาดไอคอน
            ),
            label: 'สุ่ม',
          ),
          NavigationDestination(
            icon: Image(
              image: const AssetImage("assets/images/home.png"),
              width: 20, // ลดขนาดไอคอน
            ),
            label: 'หน้าหลัก',
          ),
        ],
      ),
    );
  }

  void navigateRandomPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RandomPage()),
    );
  }

  void navigateOdrawPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OdrawPage()),
    );
  }
}
