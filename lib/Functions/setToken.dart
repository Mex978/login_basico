import 'package:shared_preferences/shared_preferences.dart';

void setToken(String user) async {
  print(user);
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('userLogged', user);
}
