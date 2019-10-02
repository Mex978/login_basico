import 'package:shared_preferences/shared_preferences.dart';

Future<String> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  final userLogged = prefs.getString('userLogged');
  print(userLogged);
  return userLogged;
}
