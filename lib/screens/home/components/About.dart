import 'package:flutter/material.dart';

class Abouts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Apple = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(60.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/images/logo.png'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Apple Store',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Think Different',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final copyright = Padding(
      padding: EdgeInsets.all(30.0),
      child: Text(
        'Copyright © by',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final copyright2 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Raden Jaka, Wandi Wardiman ,Yana Juliyana',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[Apple, welcome, lorem, copyright, copyright2],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}
