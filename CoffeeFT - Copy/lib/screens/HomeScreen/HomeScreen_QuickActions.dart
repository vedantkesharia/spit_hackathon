import 'package:flutter/material.dart';
import 'package:coffeeft/sizeconfig.dart';
import 'package:coffeeft/screens/ProfileScreen/Profile_Screen.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildActions(Icons.receipt_long),
        buildActions(Icons.favorite),
        buildActions(Icons.history),
        GestureDetector(child: buildActions(Icons.person), onTap: (){
          Navigator.pushNamed(context, Profile_Screen.id);
        },),
      ],
    );
  }

  Container buildActions(
    IconData iconname,
  ) {
    return Container(
      width: getproportionatescreenwidth(170),
      height: getproportionatescreenheight(80),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF2C9A5),
              Color(0xFFEAAC74),
              Color(0xFFE48C35),
              Color(0xFFBD732E),
              Color(0xFF8C5B2F),
            ]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(
        iconname,
        color: Colors.black,
        size: 30,
      ),
    );
  }
}
