import 'package:shop_app/PageHome.dart';
import 'package:shop_app/screens/form/form.dart';
import 'package:shop_app/screens/home/components/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/favorit.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/home/keranjang.dart';
import 'package:shop_app/screens/home/profil.dart';
import 'package:shop_app/screens/home/transaksi.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _bottomNavCurrentIndex = 0;
  List<Widget> _container = [
    new HomeScreen(),
    new Favorit(),
    new Keranjang(),
    new Transaksi(),
    new Profil(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _container[_bottomNavCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _bottomNavCurrentIndex = index;
          });
        },
        currentIndex: _bottomNavCurrentIndex,
        items: [
          BottomNavigationBarItem(
            activeIcon: new Icon(
              Icons.home,
              color: Colors.orange,
            ),
            icon: new Icon(
              Icons.home,
              color: Colors.grey,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
              activeIcon: new Icon(
                Icons.favorite,
                color: Colors.orange,
              ),
              icon: new Icon(
                Icons.favorite,
                color: Colors.grey,
              ),
              label: 'Favorite'),
          BottomNavigationBarItem(
            activeIcon: new Icon(
              Icons.add_shopping_cart,
              color: Colors.orange,
            ),
            icon: new Icon(
              Icons.add_shopping_cart,
              color: Colors.grey,
            ),
            label: 'Keranjang',
          ),
          BottomNavigationBarItem(
            activeIcon: new Icon(
              Icons.swap_horiz_sharp,
              color: Colors.orange,
            ),
            icon: new Icon(
              Icons.swap_horiz_sharp,
              color: Colors.grey,
            ),
            label: 'Transaksi',
          ),
          BottomNavigationBarItem(
            activeIcon: new Icon(
              Icons.person,
              color: Colors.orange,
            ),
            icon: new Icon(
              Icons.person,
              color: Colors.grey,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
