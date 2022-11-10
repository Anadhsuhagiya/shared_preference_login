import 'package:flutter/material.dart';
import 'package:shared_preference_login/Model.dart';
import 'package:shared_preference_login/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController uesrname = TextEditingController();
  TextEditingController Password = TextEditingController();

  bool uesrnameerror = false;
  bool passerror = false;
  bool hidepass = true;

  String uesrnamemsg = "";
  String passmsg = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initPref();
  }

  String? user1;
  String? pass1;

  initPref() async {
    Model.prefs = await SharedPreferences.getInstance();

    user1 = Model.prefs!.getString('username');
    pass1 = Model.prefs!.getString('password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Login Pannel",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            width: 200,
            height: 200,
            child: Image.network(
                'https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-83.jpg?w=2000'),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {
                print(value);
                if (uesrnameerror) {
                  if (value.isNotEmpty) {
                    setState(() {
                      uesrnameerror = false;
                    });
                  }
                }
              },
              controller: uesrname,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff000a8f), width: 3)),
                  border: OutlineInputBorder(),
                  hintText: "Enter uesrname Address",
                  labelText: "uesrname",
                  labelStyle: TextStyle(color: Color(0xff000a8f)),
                  errorText: uesrnameerror ? uesrnamemsg : null,
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color(0xff000a8f),
                  )),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 3),
            child: TextField(
              onChanged: (value) {
                print(value);
                if (passerror) {
                  if (value.isNotEmpty) {
                    setState(() {
                      passerror = false;
                    });
                  }
                }
              },
              controller: Password,
              obscureText: hidepass,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff000a8f), width: 3)),
                  border: OutlineInputBorder(),
                  hintText: "Enter Your Password",
                  labelText: "Password",
                  labelStyle: TextStyle(color: Color(0xff000a8f)),
                  suffixIcon: IconButton(
                      onPressed: () {
                        hidepass = !hidepass;
                        setState(() {});
                      },
                      icon: hidepass
                          ? Icon(
                              Icons.visibility,
                              color: Color(0xff000a8f),
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: Color(0xff676767),
                            )),
                  errorText: passerror ? passmsg : null,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color(0xff000a8f),
                  )),
            ),
          ),
          InkWell(
            onTap: () async {
              String Uesrname = uesrname.text;
              String pass = Password.text;


              if (Uesrname.isEmpty) {
                setState(() {
                  uesrnameerror = true;
                  uesrnamemsg = "Enter uesrname Address";
                });
              }  else if (pass.isEmpty) {
                setState(() {
                  passerror = true;
                  passmsg = "Enter your password";
                });
              } else {
                // Save an String value to 'action' key.
                await Model.prefs!.setString('username', '$Uesrname');
                await Model.prefs!.setString('password', '$pass');

                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return home();
                  },
                ));
              }
            },
            child: Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.only(left: 120, right: 120, top: 10),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                  color: Color(0xff000a8f),
                  shadows: [
                    BoxShadow(
                        blurRadius: 7,
                        spreadRadius: 1,
                        offset: Offset(0, 3),
                        color: Colors.black.withOpacity(0.4))
                  ],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
