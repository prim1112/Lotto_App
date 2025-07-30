import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: _buildIcon('assets/images/home.png', 0),
          label: 'หน้าแรก',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon('assets/images/ShoppingPage-bag.png', 1),
          label: 'หน้าสินค้า',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon('assets/images/WalletPage.png', 2),
          label: 'WalletPage',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon('assets/images/bill.png', 3),
          label: 'ตรวจ',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      backgroundColor: const Color(0xFF015791),
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
    );
  }

  Widget _buildIcon(String assetPath, int index) {
    bool isSelected = selectedIndex == index;
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Transform.scale(
          scale: isSelected ? 1.3 : 1.0,
          child: Image.asset(
            assetPath,
            width: 30,
            height: 30,
            color: isSelected ? Colors.white : null,
          ),
        ),
      ),
    );
  }
}
