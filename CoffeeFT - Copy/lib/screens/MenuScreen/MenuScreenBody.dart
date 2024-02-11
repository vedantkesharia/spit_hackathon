import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeeft/Models/Products.dart';
import 'package:coffeeft/screens/DetailsScreen/Details_Screen.dart';
import 'package:flutter/material.dart';
import 'package:coffeeft/constants.dart';
import 'package:coffeeft/sizeconfig.dart';
import 'package:coffeeft/cards.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //final _products = FirebaseFirestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getproportionatescreenwidth(40),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(
                    height: getproportionatescreenheight(15),
                  ),
                  Text(
                "Loans",
                style: TextStyle(
                    color: darkgreen,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: getproportionatescreenheight(15),
              ),
              LoanCards(),
              SizedBox(
                height: getproportionatescreenheight(20),
              ),
              Text(
                "Insurance",
                style: TextStyle(
                    color: darkgreen,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: getproportionatescreenheight(15),
              ),
              InsuranceCards(),
              SizedBox(
                height: getproportionatescreenheight(20),
              ),
              Text(
                "Government Schemes",
                style: TextStyle(
                    color: darkgreen,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
                  SizedBox(
                    height: getproportionatescreenheight(15),
                  ),
                  SchemeCards(),
            ])));
  }
}
