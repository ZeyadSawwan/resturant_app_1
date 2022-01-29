import 'package:flutter/material.dart';

class LoginScreenBloc {
  var isPasswordShown = false;

  bool validateLoginField(String username, String password) {
    if (username == "zeyad" && password == "123") {
      return true;
    } else {
      return false;
    }
  }

  String validateLoginFieldText(String username, String password) {
    if (username == "zeyad" && password == "123") {
      return "Correct User Name & Password";
    } else if (username.isEmpty || password.isEmpty) {
      return "";
    } else {
      return "Wrong User Name & Password";
    }
  }

  Color validateLoginFieldColor(String msg) {
    if (msg == "Correct User Name & Password") {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}
