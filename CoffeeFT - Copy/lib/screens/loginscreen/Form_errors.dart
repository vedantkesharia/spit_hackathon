import 'package:flutter/material.dart';

class FormErrors extends StatelessWidget {
  const FormErrors({
    Key? key,
    required this.Errors,
  }) : super(key: key);

  final String Errors;

  @override
  Widget build(BuildContext context) {
    return Text(
      Errors,
      style: TextStyle(
        color: Colors.black,
        fontFamily: "OpenSans",
      ),
    );
  }
}