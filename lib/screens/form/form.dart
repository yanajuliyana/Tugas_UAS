import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/screens/form/detail.dart';
import 'dart:async';
import 'dart:convert';

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
            padding: const EdgeInsets.all(10.0),
            child: new GestureDetector(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new Detailkategori(
                        list: list,
                        index: i,
                      ))),
              child: new GestureDetector(
                child: new Card(
                  child: new ListTile(
                    title: new Text(list[i]['name_catalog']),
                    leading: new Icon(Icons.image),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
