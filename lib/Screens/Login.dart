import 'package:flutter/material.dart';
import 'package:login_basico/Functions/setToken.dart';
import 'package:login_basico/Widgets/inputTextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_basico/Functions/showAlertDialog.dart';
import 'package:login_basico/Widgets/button.dart';
import 'package:login_basico/Screens/Home.dart';
import 'package:login_basico/Screens/Register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final db = Firestore.instance;
  final loginTextField = TextEditingController();
  final senhaTextField = TextEditingController();

  void _login() async {
    bool pass = false;
    if (loginTextField.text != "" && senhaTextField.text != "") {
      QuerySnapshot querySnapshot =
          await db.collection("Usuarios").getDocuments();
      for (DocumentSnapshot doc in querySnapshot.documents) {
        if (doc.data['login'] == loginTextField.text) {
          if (doc.data['senha'] == senhaTextField.text) {
            // alert("Sucesso", "Usuário logado!", context);
            pass = true;
            setToken(doc.data['login']);
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) => Home()), (_) => false);
          } else {
            alert("Erro", "Usuário/Senha incorretos", context);
            pass = true;
          }
        }
      }
      if (!pass) alert("Erro", "Usuário não existe!", context);
    }
  }

  void _register() {
    _formKey = GlobalKey<FormState>();
    loginTextField.clear();
    senhaTextField.clear();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Register()));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
            backgroundColor: Colors.lightBlue,
            body: Center(
              child: SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //  crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        inputTextField(context, loginTextField, "Login"),
                        Divider(
                          color: Colors.transparent,
                        ),
                        inputTextField(context, senhaTextField, "Senha"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Container(
                                  width: 150,
                                  height: 50,
                                  child: button(context, 'Login', Colors.yellow,
                                      _login, _formKey)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Container(
                                  width: 150,
                                  height: 50,
                                  child: button(context, "Register",
                                      Colors.white, _register, _formKey)),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            )));
  }
}
