import 'package:coffeeft/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:coffeeft/screens/SignUpScreen/SignUp_Screen.dart';
import 'package:coffeeft/sizeconfig.dart';
import 'package:provider/provider.dart';
import 'Form_errors.dart';
import 'package:coffeeft/screens/TourScreen/tourbody_component2.dart';
import 'package:coffeeft/constants.dart';
import 'package:coffeeft/screens/ForgotpassScreen/Forget_Screen.dart';
import '../Bottom_Nav_Bar.dart';


class Buildform extends StatefulWidget {
  @override
  State<Buildform> createState() => _BuildformState();
}

class _BuildformState extends State<Buildform> {
  String? errorMessage = '';
  bool check = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return Form(
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: getproportionatescreenheight(20),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Checkbox(
                value: false,
                activeColor: darkgreen,
                onChanged: (value) {
                  setState(() {
                  });
                },
              ),
              Text(
                "Remember me",
                style: kimptext,
              ),
              Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, ForgotScreen.id);
                },
                child: Text(
                  "Forgot Password",
                  style: kimptext.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          //FormErrors(Errors: errorMessage),
          SizedBox(
            height: 20,
          ),
          Commonbutton("Continue", () async {
            try {
              await auth.signInWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text);
              Navigator.pushNamed(context, Bottom_Nav.id);
            }
            catch (e){
              print(e);
            }
          }),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/4.png",
                      scale: 25,
                    ),
                    SizedBox(
                      width: getproportionatescreenwidth(10),
                    ),
                    Image.asset(
                      "assets/images/5.png",
                      scale: 25,
                    ),
                    SizedBox(
                      width: getproportionatescreenwidth(10),
                    ),
                    Image.asset(
                      "assets/images/6.png",
                      scale: 25,
                    ),
                  ],
                ),
                Text(
                  "Sign In using your\n social accounts.",
                  textAlign: TextAlign.center,
                  style: kimptext,
                ),
                Text(
                  "Or",
                  style: kimptext,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, SignUp.id);
                  },
                  child: Text(
                    "Sign Up",
                    style: kimptext.copyWith(
                      decoration: TextDecoration.underline,
                      color: darkgreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontFamily: "OpenSans",
          fontSize: 15,
          color: Colors.black,
        ),
        decoration: buildInputDecoration(
            "Email", "Enter your email here!", Icons.mail));
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _passwordController,
        obscureText: true,
        style: TextStyle(
          fontFamily: "OpenSans",
          fontSize: 15,
        ),
        decoration: buildInputDecoration(
            "Password", "Enter your password here!", Icons.password));
  }
}
