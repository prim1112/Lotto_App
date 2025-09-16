import 'package:flutter/material.dart';
import 'package:lotto_application/pages/owner/Owner_draw.dart';
import 'package:lotto_application/pages/owner/Owner_randomm.dart';
import 'package:lotto_application/services/user_session.dart';

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
          borderRadius: BorderRadius.circular(30),
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
          // ตรวจสอบว่า index ที่เลือกไม่ใช่หน้าปัจจุบัน
          if (index != selectedIndex) {
            onDestinationSelected(index);
            // 3. แก้ไขการสลับหน้าให้ส่ง adminId ไปด้วย
            switch (index) {
              case 0:
                // ใช้ push แทน pushReplacement หรือส่ง adminId ให้ชัดเจน
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RandomPage()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OdrawPage()),
                );
                break;
            }
          }
        },
        destinations: [
          NavigationDestination(
            icon: Image(
              image: const AssetImage("assets/images/random.png"),
              width: 25,
            ),
            label: 'สุ่ม',
          ),
          NavigationDestination(
            icon: Image(
              image: const AssetImage("assets/images/home.png"),
              width: 20,
            ),
            label: 'หน้าหลัก',
          ),
        ],
      ),
    );
  }
}
