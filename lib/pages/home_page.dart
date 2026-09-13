import 'package:flutter/material.dart';
import '../components/bottom_nav_bar.dart';
import 'cart_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // this selected index is to control the bottom nav bar
  int _selectedIndex = 0;

  // this method will update our selected index
  // when the user taps on the bottom bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to display
  final List<Widget> _pages = [
    // shop page
    const ShopPage(),

    // cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F2EB),
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ), // MyBottomNavBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(
                Icons.menu,
                color: Color(0xFF2D1E18),
              ), // Icon
            ), // Padding
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ), // IconButton
        ), // Builder
      ), // AppBar
      drawer: Drawer(
        backgroundColor: const Color(0xFF2D1E18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // logo
                DrawerHeader(
                  child: ClipOval(
                    child: Image.asset('lib/images/logo.png'),
                  ),
                ), // DrawerHeader

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(
                    color: Colors.brown.shade700,
                  ), // Divider
                ), // Padding

                // other pages
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.coffee_rounded,
                      color: Colors.white,
                    ), // Icon
                    title: Text(
                      'Cafetería',
                      style: TextStyle(color: Colors.white),
                    ), // Text
                  ), // ListTile
                ), // Padding

                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.forest_rounded,
                      color: Colors.white,
                    ), // Icon
                    title: Text(
                      'Nuestra Finca',
                      style: TextStyle(color: Colors.white),
                    ), // Text
                  ), // ListTile
                ), // Padding
              ],
            ), // Column

            const Padding(
              padding: EdgeInsets.only(left: 25.0, bottom: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ), // Icon
                title: Text(
                  'Cerrar sesión',
                  style: TextStyle(color: Colors.white),
                ), // Text
              ), // ListTile
            ), // Padding
          ],
        ), // Column
      ), // Drawer
      body: _pages[_selectedIndex],
    ); // Scaffold
  }
}