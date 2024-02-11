import 'package:flutter/material.dart';
import 'package:coffeeft/constants.dart';
import 'package:coffeeft/sizeconfig.dart';
import 'MenuScreenBody.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);
  static const String id = "MenuScreen";

  @override
  State<MenuScreen> createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Body(),
    );
  }
}
