import 'package:flutter/material.dart';

void alert(String title, String content, BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // retorna um objeto do tipo Dialog
      return AlertDialog(
        title: new Text(title),
        content: new Text(content),
        actions: <Widget>[
          // define os botões na base do dialogo
          new FlatButton(
            child: new Text("Fechar"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
