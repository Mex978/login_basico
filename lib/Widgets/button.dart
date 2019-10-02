import 'package:flutter/material.dart';

Widget button(BuildContext context, String content, Color cor, Function func,
    GlobalKey<FormState> formKey) {
  return RaisedButton(
    child: Text(
      content,
      style: TextStyle(fontSize: 20),
    ),
    color: cor,
    onPressed: () {
      switch (content) {
        case "Login":
          if (formKey.currentState.validate()) func();
          break;
        case "Confirmar":
          if (formKey.currentState.validate()) func();
          break;
        default:
          func();
      }
    },
  );
}
