import 'package:flutter/material.dart';
import 'package:coffeeft/constants.dart';
import 'tourscreen_body1.dart';
import 'package:coffeeft/sizeconfig.dart';

class Tourscreen extends StatelessWidget {
  static const String id = "Tourscreen_id";
  const Tourscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sizeconfiguration().access(context);
    return Container(
      color: kPrimarycolor,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Body(),
      ),
    );
  }
}
