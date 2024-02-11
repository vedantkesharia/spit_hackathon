import 'package:flutter/material.dart';
import 'package:coffeeft/constants.dart';
import 'package:coffeeft/Models/Cart_Data.dart';
import 'CartScreen_Body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const String id = "Cart_Screen";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimarycolor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              Text(
                "My Loans",
                style: TextStyle(
                  color: darkgreen,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Body(),
        //bottomSheet: CheckOutCard(),
        //bottomNavigationBar: CheckOutCard(),
      ),
    );
  }
}

