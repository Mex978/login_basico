import 'package:flutter/material.dart';

Widget inputTextField(
    BuildContext context, TextEditingController controller, String content,
    {String senha}) {
  return content.contains("Senha")
      ? TextFormField(
          obscureText: true,
          controller: controller,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              labelText: content,
              labelStyle: TextStyle(fontSize: 20)),
          style: TextStyle(color: Colors.white),
          validator: (value) {
            if (content == "Login") {
              return value.isEmpty ? "Insira seu Login" : null;
            } else if (content == "Senha" || content == "Senha novamente") {
              if (value.isEmpty)
                return "Insira sua Senha";
              // else if (content == "Senha novamente" && senha != value) {
              //   return "Senhas não coincidem";
              // }
              else
                return null;
            }
            return null;
          },
        )
      : TextFormField(
          controller: controller,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              labelText: content,
              labelStyle: TextStyle(fontSize: 20)),
          style: TextStyle(color: Colors.white),
          validator: (value) {
            if (content == "Login") {
              return value.isEmpty ? "Insira seu Login" : null;
            } else if (content == "Senha" || content == "Senha novamente") {
              return value.isEmpty ? "Insira sua Senha" : null;
            }
            return null;
          },
        );
}
