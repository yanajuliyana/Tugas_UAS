import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/form/adddata.dart';
import 'package:shop_app/screens/form/form.dart';
import 'package:shop_app/screens/home/components/About.dart';

import 'package:shop_app/screens/home/components/LoginPage.dart';
import 'package:shop_app/screens/home/components/categorries.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/home/landingpage.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class PageHome extends StatefulWidget {
  final drawerItem = [
    new DrawerItem("Home", Icons.home_work),
    new DrawerItem("Produk", Icons.smartphone),
    new DrawerItem("Kategori", Icons.category_rounded),
    new DrawerItem("Input", Icons.add_a_photo),
    new DrawerItem("About", Icons.person_add_alt),
    new DrawerItem("Logout", Icons.logout),
  ];

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new HomeScreen();
      case 1:
        return new LandingPage();
      case 2:
        return new ThirdFragment();
      case 3:
        return new AddData();
      case 4:
        return new Abouts();
      case 5:
        return new Login();

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItem.length; i++) {
      var d = widget.drawerItem[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        trailing: new Icon(Icons.arrow_right),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItem[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text("Yana Juliyana"),
              accountEmail: Text("yanajuliyana23@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.blue
                          : Colors.white,
                  child: Text(
                    "B",
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ],
            ),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
