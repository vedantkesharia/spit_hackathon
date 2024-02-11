import 'package:flutter/material.dart';
import 'package:coffeeft/sizeconfig.dart';
import 'package:coffeeft/constants.dart';
import 'package:coffeeft/screens/TourScreen/tourbody_component2.dart';
import 'package:coffeeft/screens/SignUpScreen/SignUpform_errors.dart';

class BuildForm extends StatefulWidget {
  const BuildForm({Key? key}) : super(key: key);

  @override
  State<BuildForm> createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  final _formstate = GlobalKey<FormState>();
  final List<String> Errors = [];
  late String? email;
  late String? password;
  late String? Confirmpassword;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formstate,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: getproportionatescreenheight(20),
          ),
          buildPassFormField(),
          SizedBox(
            height: getproportionatescreenheight(20),
          ),
          buildConfirmpassFormField(),
          Signupform_errors(Errors: Errors),
          SizedBox(
            height: getproportionatescreenheight(30),
          ),
          Commonbutton("Continue", () {
            // if (_formstate.currentState!.validate()) {
            //   _formstate.currentState!.save();
            //   if(Errors.isEmpty){
            //   }
            // }
          }),
          SizedBox(height: getproportionatescreenheight(20),),
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
            "Or Sign Up using\nSocial Media handles!",
            style: kimptext,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  TextFormField buildConfirmpassFormField() {
    return TextFormField(
      onSaved: (value) {
        Confirmpassword = value;
      },
      onChanged: (value) {
        if (value != null &&
            value.isNotEmpty &&
            Errors.contains(kconfpassnull)) {
          setState(() {
            Errors.remove(kconfpassnull);
          });
        } else if (value != null &&
            value == password &&
            Errors.contains(knopassmatch)) {
          setState(() {
            Errors.remove(knopassmatch);
          });
        }
        return null;
      },
      validator: (value) {
        if (value != null && value.isEmpty && !Errors.contains(kconfpassnull) &&!Errors.contains(knullpasserror)) {
          setState(() {
            Errors.add(kconfpassnull);
          });
        } else if (value != null &&
            value != password &&
            !Errors.contains(knopassmatch) &&
            !Errors.contains(kconfpassnull)) {
          setState(() {
            Errors.add(knopassmatch);
          });
        }
        return null;
      },
      obscureText: true,
      decoration: buildInputDecoration(
          "Confirm Password", "Confirm your password", Icons.lock_outline),
    );
  }

  TextFormField buildPassFormField() {
    return TextFormField(
      onSaved: (newvalue) {
        password = newvalue;
      },
      onChanged: (value) {
        if (value != null &&
            value.isNotEmpty &&
            Errors.contains(knullpasserror)) {
          setState(() {
            Errors.remove(knullpasserror);
          });
        } else if (value != null &&
            value.length > 6 &&
            Errors.contains(kshortpass)) {
          setState(() {
            Errors.remove(kshortpass);
          });

        }
        password = value;
        return null;
      },
      validator: (value) {
        if (value != null &&
            value.isEmpty &&
            !Errors.contains(knullpasserror)) {
          setState(() {
            Errors.add(knullpasserror);
          });
        } else if (value != null &&
            value.length < 6 &&
            !Errors.contains(kshortpass) &&
            !Errors.contains(knullpasserror)) {
          setState(() {
            Errors.add(kshortpass);
          });
        }
        return null;
      },
      obscureText: true,
      decoration: buildInputDecoration(
          "Password", "Enter your password here!", Icons.password),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
        onSaved: (newvalue) {
          email = newvalue;
        },
        onChanged: (value) {
          if (value.isNotEmpty && Errors.contains(kemailnullerror)) {
            setState(() {
              Errors.remove(kemailnullerror);
            });
          } else if (value.contains("@") && Errors.contains(kvalidemailerror)) {
            setState(() {
              Errors.remove(kvalidemailerror);
            });
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty && !Errors.contains(kemailnullerror)) {
            setState(() {
              Errors.add(kemailnullerror);
            });
          } else if (value != null &&
              !value.contains("@") &&
              !Errors.contains(kvalidemailerror) &&
              !Errors.contains(kemailnullerror)) {
            setState(() {
              Errors.add(kvalidemailerror);
            });
          }
          return null;
        },
        decoration: buildInputDecoration(
            "Email", "Enter your email here!", Icons.mail));
  }
}
