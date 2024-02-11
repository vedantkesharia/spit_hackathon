import 'package:flutter/material.dart';

const darkgreen = Color(0xFF355a4d);
const green = Color(0xFF349E2B);
const deepgreen = Color(0xFF01663a);
const kPrimarycolor = Color(0xFFFFFFFF);
const kSceondarycolor = Color(0xFFD8F3D7);
const kTextcolor = Colors.black;

const String kemailnullerror = "Please Enter the email";
const String kvalidemailerror = "Please enter valid email";
const String knullpasserror = "Please enter the password";
const String kshortpass = "Entered password is too short";
const String knopassmatch = "Password didn't match!";
const String kconfpassnull = "Please Confirm the password";
const String kfirstnamenull = "Please Enter your First name";
const String kLastnamenull = "Please Enter your Last name";
const String knumbernull = "Please Enter your phone number";
const String kaddressnull = "Please Enter your address";
const String knumnotvalid = "The Entered number is not valid";
const String kinvalidaddress = "Address must contains atleast 8 characters";

const kimptext = TextStyle(
  color: Colors.black,
  fontFamily: "OpenSans",
  fontSize: 14,
);
const ktextformfieldstyle = TextStyle(
  fontSize: 15,
  fontFamily: "OpenSans",
);
InputDecoration buildInputDecoration(
    String lbltext, String hinttext, IconData icons) {
  return InputDecoration(
    labelText: lbltext,
    labelStyle: TextStyle(
      fontFamily: "OpenSans",
      fontWeight: FontWeight.bold,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    hintText: hinttext,
    hintStyle: TextStyle(
      fontFamily: "OpenSans",
      fontWeight: FontWeight.bold,
    ),
    suffixIcon: Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Icon(
        icons,
        size: 40,
      ),
    ),
  );
}


InputDecoration kOTPboxesDecoration = InputDecoration(
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(color: Colors.brown),
);
}



