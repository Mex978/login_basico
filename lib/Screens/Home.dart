import 'package:flutter/material.dart';
import 'package:login_basico/Functions/getToken.dart';
import 'package:login_basico/Functions/setToken.dart';
import 'package:login_basico/Screens/Login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String user;

  Future getUser() async {
    await getToken().then((s) {
      setState(() {
        user = s;
      });
    });
  }

  void _sair() {
    setToken(null);
    if (!Navigator.canPop(context)) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Login()), (_) => false);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Bem-vindo $user",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Divider(color: Colors.transparent),
            Container(
              width: 250,
              height: 40,
              child: RaisedButton(
                child: Text(
                  "Sair",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () => _sair(),
              ),
            )
          ],
        )));
  }
}
