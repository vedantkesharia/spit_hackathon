import 'package:flutter/material.dart';
import 'package:coffeeft/constants.dart';
import 'SignUp_Form.dart';
import 'package:coffeeft/sizeconfig.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          SizedBox(
            height: getproportionatescreenheight(30),
          ),
          Text(
            "Register your Account",
            textAlign: TextAlign.center,
            style: TextStyle(color: darkgreen, fontSize: 30),
          ),
          SizedBox(
            height: getproportionatescreenheight(30),
          ),
          BuildForm(),
        ],
      ),
    );
  }
}
