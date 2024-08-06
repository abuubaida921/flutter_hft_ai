import 'package:shared_preferences/shared_preferences.dart';

class UserPref {
  Future<bool> saveEmailPass(email,pass) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('sRemember','1');
    sp.setString('sEmail',email ?? '');
    sp.setString('sPass',pass ?? '');
    return true;
  }

  Future<bool> removeEmailPass() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();

    return true;
  }

  Future<dynamic> getEmail() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var myData = sp.getString('sEmail');
    return myData;
  }

  Future<dynamic> getPass() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var myData = sp.getString('sPass');
    return myData;
  }
}