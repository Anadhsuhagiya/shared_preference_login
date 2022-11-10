import 'package:flutter/material.dart';
import 'package:shared_preference_login/login.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ElevatedButton(onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return login();
          },));
        }, child: Text("Log Out",style: TextStyle(fontSize: 20),)),
    );
  }
}
