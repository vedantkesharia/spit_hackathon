import 'package:flutter/material.dart';
import 'package:coffeeft/sizeconfig.dart';
import 'package:coffeeft/constants.dart';

class Signupform_errors extends StatelessWidget {
  const Signupform_errors({
    Key? key,
    required this.Errors,
  }) : super(key: key);

  final List<String> Errors;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            Errors.length, (index) => buildErrors(Errors[index])));
  }

  Row buildErrors(String text) {
    return Row(
      children: [
        Icon(
          Icons.error,
          color: Colors.red.shade200,
        ),
        SizedBox(
          width: getproportionatescreenwidth(4),
        ),
        Text(
          text,
          style: kimptext,
        ),
      ],
    );
  }
}
