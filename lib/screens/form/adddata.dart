import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:async/async.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Img;
import 'dart:math' as Math;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerKategori = new TextEditingController();
  File _image;

  //ambil foto dari gallery
  Future getImageGallery() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    int rand = new Math.Random().nextInt(100000);
    Img.Image image = Img.decodeImage(imageFile.readAsBytesSync());
    Img.Image smallerImg = Img.copyResize(image, width: 224, height: 224);
    print(smallerImg);
    var compressImg = new File("$path/image_$rand.jpg")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));
    setState(() {
      _image = compressImg;
    });
  }

  //ambil foto dari camera
  Future getImageCamera() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    int rand = new Math.Random().nextInt(100000);
    Img.Image image = Img.decodeImage(imageFile.readAsBytesSync());
    Img.Image smallerImg = Img.copyResize(image, width: 224, height: 224);
    var compressImg = new File("$path/image_$rand.jpg")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));
    setState(() {
      _image = compressImg;
    });
  }

  Future addData(File imageFile) async {
    var url =
        Uri.parse("https://projectfluttercrud.000webhostapp.com/addnews.php");
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var request = new http.MultipartRequest("POST", url);
    var multipartFile = new http.MultipartFile("image", stream, length,
        filename: basename(imageFile.path));
    request.fields['newscatalog'] = controllerKategori.text;
    request.files.add(multipartFile);
    var response = await request.send();
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Data Berhasil Ditambahkan Silahkan Cek di Menu Kategori",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM);
    } else {
      Fluttertoast.showToast(
          msg: "Data Gagal Ditambahkan, Coba Lagi!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM);
    }
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        //tampilkan image yang sudah dipilih
        Center(
          child: _image == null
              ? new Text("No image selected!")
              : new Image.file(_image),
        ),
        Padding(
            padding: EdgeInsets.all(10.30),
            child: TextField(
              controller: controllerKategori,
              decoration: new InputDecoration(
                  hintText: "Isi Kategori disini...", labelText: "Kategori"),
            )),

        Row(
          children: <Widget>[
            RaisedButton(
              child: Icon(Icons.image),
              onPressed: getImageGallery,
            ),
            RaisedButton(
              child: Icon(Icons.camera_alt),
              onPressed: getImageCamera,
            ),
            Expanded(
              child: Container(),
            ),
            RaisedButton(
              child: Text("TAMBAH DATA"),
              onPressed: () {
                print(_image);
                addData(_image);
              },
            ),
          ],
        ),
      ],
    );
  }
}
