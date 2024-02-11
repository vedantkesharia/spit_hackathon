import 'package:flutter/material.dart';
import 'package:coffeeft/constants.dart';
import 'package:coffeeft/sizeconfig.dart';

class touchscreenbody extends StatelessWidget {
  touchscreenbody(this.imgno, this.text);
  final String? imgno;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset(
            "assets/images/$imgno.png",
            fit: BoxFit.cover,
            height: getproportionatescreenheight(350),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            "$text",
            style: TextStyle(color: kTextcolor, fontSize: 20),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
