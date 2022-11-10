import 'package:flutter/material.dart';
import 'package:shared_preference_login/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: login(),
    theme: ThemeData(fontFamily: 'Arial'),
  ));
}
