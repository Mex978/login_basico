import 'package:flutter/material.dart';
import 'package:login_basico/Screens/Login.dart';
import 'package:login_basico/Widgets/inputTextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_basico/Functions/showAlertDialog.dart';
import 'package:login_basico/Widgets/button.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final db = Firestore.instance;
  bool isDisabled = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final loginTextField = TextEditingController();
  final senhaTextField = TextEditingController();
  final senhaNovamenteTextField = TextEditingController();

  void _cadastrar() async {
    _formKey = GlobalKey<FormState>();
    if (loginTextField.text != "" && senhaTextField.text != "") {
      QuerySnapshot querySnapshot =
          await db.collection("Usuarios").getDocuments();
      if (querySnapshot.documents.length == 0) {
        db.collection("Usuarios").document().setData(
            {"login": loginTextField.text, "senha": senhaTextField.text});
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => Login()), (_) => false);
      } else {
        for (DocumentSnapshot doc in querySnapshot.documents) {
          if (doc.data['login'] == loginTextField.text) {
            alert("Erro", "Usuário já existe!", context);
            return;
          }
        }
        db.collection("Usuarios").document().setData(
            {"login": loginTextField.text, "senha": senhaTextField.text});
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => Login()), (_) => false);
      }
    }
  }

  void _voltar() {
    Navigator.pop(context);
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
                          Divider(
                            color: Colors.transparent,
                          ),
                          inputTextField(context, senhaNovamenteTextField,
                              "Senha novamente",
                              senha: senhaTextField.text),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: Container(
                                    width: 150,
                                    height: 50,
                                    child: button(context, "Confirmar",
                                        Colors.yellow, _cadastrar, _formKey)),
                              ),
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: Container(
                                    width: 150,
                                    height: 50,
                                    child: button(context, "Voltar",
                                        Colors.white, _voltar, _formKey)),
                              )
                            ],
                          )
                        ],
                      ),
                    )))));
  }
}
