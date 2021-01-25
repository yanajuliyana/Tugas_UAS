import 'package:flutter/material.dart';
import 'package:shop_app/PageHome.dart';

import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: PageHome(),
    );
  }
}
