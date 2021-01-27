import 'package:flutter/material.dart';
import 'package:shop_app/PageHome.dart';
import 'package:shop_app/screens/home/components/Daftar.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController txtUsername = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();

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
              width: 100.0,
              height: 80.0,
              decoration: BoxDecoration(),
              child: Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Image.asset(
                    "assets/images/logo.png",
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "LOGIN",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: txtUsername,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87)),
                prefixIcon: Icon(
                  Icons.person,
                  size: 40,
                ),
                hintText: "Masukan Nama",
                hintStyle: TextStyle(color: Colors.black87),
                labelText: "Nama",
                labelStyle: TextStyle(color: Colors.black87),
              ),
            ),
            SizedBox(
              height: 10,
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
                  size: 40,
                ),
                hintText: "Masukan Password",
                hintStyle: TextStyle(color: Colors.black),
                labelText: "Pssword",
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ButtonTheme(
              minWidth: double.infinity,
              child: RaisedButton(
                  onPressed: () {
                    String username = txtUsername.text;
                    String password = txtPassword.text;
                    if (username == "admin" && password == "admin") {
                      showDialog(
                          context: context,
                          child: AlertDialog(
                            title: Text("Login"),
                            content: Text("Berhasil"),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return PageHome();
                                    }));
                                  },
                                  child: Text("OK"))
                            ],
                          ));
                    }
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            ButtonTheme(
              minWidth: double.infinity,
              child: RaisedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        child: AlertDialog(
                          title: Text("Apakah kamu Ingin Daftar?"),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Daftar();
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
