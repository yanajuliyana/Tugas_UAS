import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/PageHome.dart';
import 'package:shop_app/screens/details/components/add_to_cart.dart';
import 'package:shop_app/screens/details/components/description.dart';
import 'package:shop_app/screens/details/components/product_title_with_image.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/form/detail.dart';
import 'dart:async';
import 'dart:convert';

import 'package:shop_app/screens/home/components/body.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/home/item_card.dart';

class ThirdFragment extends StatefulWidget {
  @override
  _ThirdFragmentState createState() => _ThirdFragmentState();
}

class _ThirdFragmentState extends State<ThirdFragment> {
  Future<List> getData() async {
    final response = await http
        .get("https://projectfluttercrud.000webhostapp.com/listnews.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Container(
            color: Colors.brown,
            padding: const EdgeInsets.all(10.0),
            child: new GestureDetector(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new Detailkategori(
                        list: list,
                        index: i,
                      ))),
              child: new GestureDetector(
                child: new Card(
                  child: Row(
                    children: [
                      Image.network(
                        'https://projectfluttercrud.000webhostapp.com/image/' +
                            list[i]['icon'],
                        height: 250.0,
                        width: 200.0,
                      ),
                      Padding(padding: const EdgeInsets.all(10.0)),
                      Text(
                        list[i]['name_catalog'],
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      Padding(padding: const EdgeInsets.all(10.0)),
                      RaisedButton(
                          color: Colors.orange,
                          child: Text("Detail"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PageHome()));
                          }),
                    ],
                  ),
                  // child: new ListTile(
                  //   title: new Text(list[i]['name_catalog']),
                  //   // leading: new Icon(Icons.image),
                  //   // leading: GestureDetector(
                  //   //   child: Image.network(
                  //   //     'https://projectfluttercrud.000webhostapp.com/image/' +
                  //   //         list[i]['icon'],
                  //   //     height: 200.0,
                  //   //     width: 200.0,
                  //   //   ),
                  //   // ),
                  //   // leading: Image.network(
                  //   //   'https://projectfluttercrud.000webhostapp.com/image/' +
                  //   //       list[i]['icon'],
                  //   //   height: 200.0,
                  //   //   width: 200.0,
                  //   // ),
                  // ),
                ),
              ),
            ),
          );
        });
  }
}
