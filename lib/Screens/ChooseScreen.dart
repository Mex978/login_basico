import 'package:flutter/material.dart';
import 'package:login_basico/Screens/Home.dart';
import 'package:login_basico/Screens/Login.dart';
import 'package:login_basico/Functions/getToken.dart';

class ChooseScreen extends StatefulWidget {
  @override
  _ChooseScreenState createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  String user;

  Future getUser() async {
    await getToken().then((s) {
      setState(() {
        user = s;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // NOTE: Calling this function here would crash the app.
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return user != null ? Home() : Login();
  }
}
