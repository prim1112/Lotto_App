// import 'package:flutter/material.dart';
// import 'package:lotto_app/homepage.dart';
// import 'package:lotto_app/profile.dart'; // นำเข้า ProfilePage
// import 'package:lotto_app/bill.dart'; // นำเข้า BillPage
// import 'package:lotto_app/ShoppingPage_bag.dart'; // นำเข้า ShoppingPageBagPage
// import 'package:lotto_app/WalletPage.dart'; // นำเข้า WalletPagePage
// import 'bottom_navigation_bar.dart';

// class HomePageNavigation extends StatefulWidget {
//   const HomePageNavigation({super.key});

//   @override
//   _HomePageNavigationState createState() => _HomePageNavigationState();
// }

// class _HomePageNavigationState extends State<HomePageNavigation> {
//   int _selectedIndex = 0; // เก็บสถานะการเลือกของแถบด้านล่าง

//   // รายการหน้าเพจที่ต้องการนำทาง
//   final List<Widget> _pages = [
//     //  Homepage(), // หน้าหลัก
//     ShoppingPage(), // หน้าช็อปปิ้ง
//     const WalletPage(), // หน้ากระเป๋าเงิน
//     const Bill(), // หน้าบิล
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFE1F5FE),
//         automaticallyImplyLeading: false,
//         title: Align(
//           alignment: Alignment.centerLeft,
//           child: Image.asset(
//             'assets/images/Screenshot (1724).png', // เปลี่ยนเป็นโลโก้ที่ต้องการ
//             width: 150,
//             height: 50,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Image.asset(
//               'assets/images/5.png', // เพิ่มไอคอนที่ต้องการ
//               width: 30,
//               height: 30,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const ProfilePage(),
//                 ), // นำทางไปที่ ProfilePage
//               );
//             },
//           ),
//         ],
//       ),
//       body: IndexedStack(
//         index: _selectedIndex, // เลือกหน้าแสดงตามสถานะ
//         children: _pages, // หน้าเพจทั้งหมดที่ใช้ในการเปลี่ยนหน้า
//       ),
//       bottomNavigationBar: CustomBottomNavigationBar(
//         selectedIndex: _selectedIndex,
//         onItemTapped: _onItemTapped, // ส่งฟังก์ชันที่จัดการการนำทาง
//       ),
//     );
//   }
// }
