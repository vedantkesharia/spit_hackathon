import 'package:flutter/material.dart';
import 'package:coffeeft/constants.dart';
import 'loginscreen_body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = "LoginScreen_id";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        backgroundColor: kPrimarycolor,
        body: Body(),
    );
  }
}
