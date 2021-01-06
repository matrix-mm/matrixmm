import 'package:flutter/material.dart';
import 'package:matrixmm/pages/dashboard_page.dart';
import 'package:matrixmm/utils/cart_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _widgetList = [
    DashboardPage(),
    DashboardPage(),
    DashboardPage(),
    DashboardPage()
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CartIcons.home,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Store',
              style: TextStyle(),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CartIcons.cart,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Cart',
              style: TextStyle(),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CartIcons.favourites,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Favourites',
              style: TextStyle(),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CartIcons.account,
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Account',
              style: TextStyle(),
            ),
          ),
        ],
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
      body: _widgetList[_index],
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      brightness: Brightness.dark,
      elevation: 0,
      backgroundColor: Colors.black87,
      automaticallyImplyLeading: false,
      title: Text(
        "MATRiX OnlineShop",
        style: TextStyle(color: Colors.amberAccent[700]),
      ),
      actions: [
        Icon(
          Icons.notifications_none,
          color: Colors.white54,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.shopping_cart,
          color: Colors.white54,
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
