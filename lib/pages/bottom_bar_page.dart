import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app1/pages/Profile_page.dart';
import 'package:flutter_test_app1/pages/cart_page.dart';
import 'package:flutter_test_app1/pages/home_page.dart';
import 'package:flutter_test_app1/pages.2/sold_page.dart';

class bottombarpage extends StatefulWidget {
  bottombarpage({Key? key}) : super(key: key);

  @override
  State<bottombarpage> createState() => _bottombarpageState();
}

class _bottombarpageState extends State<bottombarpage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color.fromARGB(255, 66, 66, 66),
        items: [
          Icon(Icons.home, color: Colors.white),
          Icon(
            Icons.portrait,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
        ],
        onTap: _onTappedBar,

        // currentIndex: _selectedIndex,
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          homepage(),
          soldpage(),
          CartPage(),
          profilepage(),
        ],
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
      ),
    );
    // bottomNavigationBar: BottomNavigationBar(
    //   items: [
    //     BottomNavigationBarItem(
    //         backgroundColor: Color.fromARGB(255, 68, 67, 67),
    //         icon: Icon(Icons.home),
    //         label: "Home"),
    //     BottomNavigationBarItem(
    //         backgroundColor: Color.fromARGB(255, 68, 67, 67),
    //         icon: Icon(Icons.portrait),
    //         label: "Sold"),
    //     BottomNavigationBarItem(
    //         backgroundColor: Color.fromARGB(255, 68, 67, 67),
    //         icon: Icon(Icons.shopping_cart),
    //         label: "Cart"),
    //     BottomNavigationBarItem(
    //         backgroundColor: Color.fromARGB(255, 68, 67, 67),
    //         icon: Icon(Icons.person),
    //         label: "Profile")
    //   ],
    //   onTap: _onTappedBar,
    //   selectedItemColor: Colors.white,
    //   currentIndex: _selectedIndex,
    // ),
    // body: PageView(
    //   controller: _pageController,
    //   children: <Widget>[
    //     homepage(),
    //     soldpage(),
    //     CartPage(),
    //     profilepage(),
    //   ],
    //   onPageChanged: (page) {
    //     setState(() {
    //       _selectedIndex = page;
    //     });
    //   },
    // ),
  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
}
