import 'package:flutter/material.dart';
import 'package:coffeeft/constants.dart';
import 'package:coffeeft/sizeconfig.dart';
import 'LikeScreenBody.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({Key? key}) : super(key: key);
  static const String id = "MenuScreen";

  @override
  State<LikeScreen> createState() => LikeScreenState();
}

class LikeScreenState extends State<LikeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimarycolor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Your Likes",
            style: TextStyle(
              color: Colors.brown,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Body(),
      ),
    );
  }
}
