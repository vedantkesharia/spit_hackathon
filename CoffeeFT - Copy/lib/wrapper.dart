import 'package:coffeeft/screens/Bottom_Nav_Bar.dart';
import 'package:coffeeft/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffeeft/screens/loginscreen/login_screen.dart';
import 'package:coffeeft/services/auth_service.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sizeconfiguration().access(context);
    final auth = Provider.of<Auth>(context);
    return StreamBuilder(
    stream: auth.authStateChanges,
      builder: (context, snapshot) {
      if(snapshot.hasData)
        return Bottom_Nav();
      return LoginScreen();
      } ,);
  }
}
