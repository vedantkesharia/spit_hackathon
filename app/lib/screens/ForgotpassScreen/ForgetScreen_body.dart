import 'package:flutter/material.dart';
import 'package:coffeeft/constants.dart';
import 'package:coffeeft/sizeconfig.dart';
import 'package:coffeeft/screens/TourScreen/tourbody_component2.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            "Oop's",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.brown,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: getproportionatescreenheight(30),
          ),
          Text(
            "Don't Worry!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.brown,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "We'll help you by sending the verification code at your registered email.",
            style: kimptext,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: getproportionatescreenheight(80),
          ),
          BuildForm(),
        ],
      ),
    );
  }
}

class BuildForm extends StatefulWidget {
  @override
  State<BuildForm> createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  final _formkey = GlobalKey<FormState>();
  final List<String> ErrorList = ["Here's the Demo error!"];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          EmailTextFormField(),
          SizedBox(
            height: getproportionatescreenheight(10),
          ),
          Formerrors(ErrorList: ErrorList),
          SizedBox(
            height: getproportionatescreenheight(50),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  children: [
                    Row(
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
                      "Sign In using the your\n social accounts.",
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
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
                        style: kimptext.copyWith(
                          decoration: TextDecoration.underline,
                          color: Colors.brown.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Commonbutton("Continue", () {
                if (_formkey.currentState!.validate()) {
                  _formkey.currentState!.save();
                }
              }),
            ],
          ),
        ],
      ),
    );
  }

  TextFormField EmailTextFormField() {
    return TextFormField(
      validator: (value) {
        if (value != null &&
            value.isEmpty &&
            !ErrorList.contains(kemailnullerror)) {
          setState(() {
            ErrorList.add(kemailnullerror);
          });
        } else if (value != null &&
            !value.contains("@") &&
            !ErrorList.contains(kvalidemailerror)) {
          setState(() {
            ErrorList.add(kvalidemailerror);
          });
        }
      },
      decoration: InputDecoration(
        hintText: "Enter your Email here...",
        hintStyle: TextStyle(
          fontFamily: "OpenSans",
          fontWeight: FontWeight.bold,
        ),
        labelText: "Email",
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: "OpenSans",
        ),
        floatingLabelStyle: TextStyle(
          color: Colors.blue,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.mail,
            size: 40,
          ),
        ),
      ),
      style: ktextformfieldstyle,
    );
  }
}

class Formerrors extends StatelessWidget {
  const Formerrors({
    Key? key,
    required this.ErrorList,
  }) : super(key: key);

  final List<String> ErrorList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        ErrorList.length,
        (index) => buildErrors(ErrorList[index]),
      ),
    );
  }

  Row buildErrors(String text) {
    return Row(
      children: [
        Icon(
          Icons.error,
          color: Colors.red.shade300,
        ),
        SizedBox(
          width: getproportionatescreenwidth(5),
        ),
        Text(
          text,
          style: kimptext,
        ),
      ],
    );
  }
}
