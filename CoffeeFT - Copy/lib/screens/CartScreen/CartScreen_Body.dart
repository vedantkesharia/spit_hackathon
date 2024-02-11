import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeeft/screens/CartScreen/CartScreen_CheckOutCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:coffeeft/sizeconfig.dart';
import 'package:coffeeft/Models/Cart_Data.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../cards.dart';
import '../../constants.dart';
import 'CartScreen_ItemCards.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final _currentUser = FirebaseAuth.instance.currentUser?.uid;
    return SlidingUpPanel(
      color: Colors.transparent,
      minHeight: getproportionatescreenheight(90),
      maxHeight: getproportionatescreenheight(600),
      panel: CheckOutCard(),
      collapsed: CollapsedCard(),
      onPanelSlide: (number){
        setState(() {});
      },
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getproportionatescreenwidth(40),
        ),
        child: Content(),
      ),
    );
  }
}

Future<int> Price(Cart product) async {
  var data = await FirebaseFirestore.instance
      .collection('products')
      .doc(product.product).get();
  return data['price'];
}

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

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
                "Current Loans",
                style: TextStyle(
                    color: darkgreen,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: getproportionatescreenheight(15),
              ),
              CurrentLoanCards(),
              SizedBox(
                height: getproportionatescreenheight(20),
              ),
              Text(
                "Current Insurances",
                style: TextStyle(
                    color: darkgreen,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: getproportionatescreenheight(15),
              ),
              CurrentInsuranceCards(),
              SizedBox(
                height: getproportionatescreenheight(20),
              ),
            ])));
  }
}
