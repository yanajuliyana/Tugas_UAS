import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/PageHome.dart';

class EditKatalog extends StatefulWidget {
  final List list;
  final int index;

  EditKatalog({this.list, this.index});

  @override
  _EditKatalogState createState() => new _EditKatalogState();
}

class _EditKatalogState extends State<EditKatalog> {
  TextEditingController controllerKategori;

  void editData() {
    var url = "https://projectfluttercrud.000webhostapp.com/editnews.php";
    http.post(url, body: {
      "idkategori": widget.list[widget.index]['id'],
      "namakategori": controllerKategori.text
    });
  }

  @override
  void initState() {
    controllerKategori = new TextEditingController(
        text: widget.list[widget.index]['name_catalog']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Edit Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            new TextField(
              controller: controllerKategori,
              decoration: new InputDecoration(
                  hintText: "Kategori", labelText: "Kategori"),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(
              child: new Text("Edit Data"),
              color: Colors.blueAccent,
              onPressed: () {
                editData();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new PageHome()));
              },
            )
          ],
        ),
      ),
    );
  }
}
