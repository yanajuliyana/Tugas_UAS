import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/PageHome.dart';
import 'package:shop_app/screens/form/edit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Detailkategori extends StatefulWidget {
  List list;
  int index;
  Detailkategori({this.index, this.list});
  @override
  _DetailkategoriState createState() => new _DetailkategoriState();
}

class _DetailkategoriState extends State<Detailkategori> {
  String imageData;
  bool dataLoaded = false;

  void deleteData() {
    var url = "https://projectfluttercrud.000webhostapp.com/deletenews.php";
    http.post(url, body: {'idnews': widget.list[widget.index]['id']});

    Fluttertoast.showToast(
        msg: "Kategori " +
            widget.list[widget.index]['name_catalog'] +
            " Berhasil Dihapus!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM);
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Anda yakin menghapus kategori ini? Nama Kategori : '${widget.list[widget.index]['name_catalog']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text(
            "OK DELETE!",
            style: new TextStyle(color: Colors.black),
          ),
          color: Colors.red,
          onPressed: () {
            deleteData();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => new PageHome()),
            );
          },
        ),
        new RaisedButton(
          child: new Text("CANCEL", style: new TextStyle(color: Colors.black)),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("${widget.list[widget.index]['name_catalog']}")),
      body: new Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Text(
                  widget.list[widget.index]['name_catalog'],
                  style: new TextStyle(fontSize: 20.0),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                        child: new Text("EDIT"),
                        color: Colors.green,
                        onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditKatalog(
                                      list: widget.list, index: widget.index)),
                            )),
                    new RaisedButton(
                      child: new Text("DELETE"),
                      color: Colors.red,
                      onPressed: () => confirm(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
