import 'package:flutter/material.dart';
import 'package:coffeeft/constants.dart';
import 'ForgetScreen_body.dart';

class ForgotScreen extends StatefulWidget {
  static const String id = "ForgetScreen_id";

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: kPrimarycolor,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Forgot Password",
              style: TextStyle(
                color: Colors.brown,
              ),
            ),
          ),
          body: Body(),
        ),
      ),
    );
  }
}
