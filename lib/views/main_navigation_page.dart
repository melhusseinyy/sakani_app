import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakni/views/home_page.dart';
import 'package:sakni/views/offers_page.dart';
import 'package:sakni/views/orders_page.dart';
import 'package:sakni/views/settings_page.dart';
import 'package:sakni/views/wallet_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),        // index 0
    OrdersPage(),      // index 1
    WalletPage(),      // index 2
    OffersPage(),      // index 3
    SettingsPage(),    // index 4
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        height: 75.h,
        buttonBackgroundColor: const Color(0xff008080),
        backgroundColor: Colors.transparent,
        items: [
          CurvedNavigationBarItem(
              child: Image.asset('assets/images/Frame 1597881695.png'),
              label: 'الرئيسية'),
          CurvedNavigationBarItem(
              child: Image.asset('assets/images/Frame 1597881694.png'),
              label: 'طلباتي'),
          CurvedNavigationBarItem(
              child: Image.asset('assets/images/Frame 1597881693.png'),
              label: 'محفظتي'),
          CurvedNavigationBarItem(
              child: Image.asset('assets/images/Frame 1597881692.png'),
              label: 'العروض'),
          CurvedNavigationBarItem(
              child: Image.asset('assets/images/Frame 1597881691.png'),
              label: 'الاعدادات'),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
