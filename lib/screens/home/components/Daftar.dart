import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/LoginPage.dart';

class Daftar extends StatefulWidget {
  Daftar({Key key}) : super(key: key);
  @override
  _DaftarState createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  TextEditingController txtUsername = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();
  TextEditingController txtemail = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(28.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.orange,
            Colors.lightBlueAccent,
          ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 450.0,
              height: 80.0,
              decoration: BoxDecoration(),
              child: Padding(
                  padding: EdgeInsets.only(top: 1.0),
                  child: Image.asset(
                    "assets/images/logo.png",
                  )),
            ),
            Padding(padding: EdgeInsets.all(20.0)),
            Text(
              "DAFTAR",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            TextFormField(
              controller: txtUsername,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87)),
                prefixIcon: Icon(
                  Icons.person,
                  size: 20,
                ),
                hintText: "Masukan Nama",
                hintStyle: TextStyle(color: Colors.black87),
                labelText: "Nama",
                labelStyle: TextStyle(color: Colors.black87),
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            TextFormField(
              controller: txtemail,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                prefixIcon: Icon(
                  Icons.email,
                  size: 20,
                ),
                hintText: "Maskan Email",
                hintStyle: TextStyle(color: Colors.black),
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            TextFormField(
              controller: txtPassword,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                prefixIcon: Icon(
                  Icons.lock,
                  size: 20,
                ),
                hintText: "Masukan Password",
                hintStyle: TextStyle(color: Colors.black),
                labelText: "Pssword",
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            ButtonTheme(
              minWidth: double.infinity,
              child: RaisedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        child: AlertDialog(
                          title: Text("Apakah Data nya sudah Benar?"),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Login();
                                  }));
                                },
                                child: Text("Iya"))
                          ],
                        ));
                  },
                  child: Text(
                    "DAFTAR",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
