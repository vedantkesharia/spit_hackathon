import 'package:coffeeft/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:coffeeft/Models/Products.dart';
import 'package:coffeeft/sizeconfig.dart';
import 'package:quantity_input/quantity_input.dart';
import 'DetailsScreen_ImagePrev.dart';
import 'Details_Screen_ProDesc.dart';

class Body extends StatefulWidget {
  Body({super.key, required this.image, this.name, this.limit});
  late final image;
  late final name;
  late final limit;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    int simpleIntInput = 1000;
    return Column(
      children: [
        Image_Preview(imageurl: widget.image),
        Expanded(
          child: Container(
            color: darkgreen,
            padding: EdgeInsets.symmetric(
              horizontal: getproportionatescreenwidth(50),
              vertical: getproportionatescreenwidth(50),
            ),
            width: double.infinity,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Product_Heading(name: widget.name,),
                SizedBox(
                  height: getproportionatescreenheight(20),
                ),
                //ProductDescription(product: widget.product),
                Spacer(),
                //AddToCart(product: widget.product),
                QuantityInput(
                  value: simpleIntInput,
                  onChanged: (value) {
                    print(value);
                    setState(() => simpleIntInput =
                        int.parse(value.replaceAll(',', '')));
                    final _currentUser = FirebaseAuth.instance.currentUser?.uid;
                    // final _cartItems =
                    // FirebaseFirestore.instance.collection('cart').doc(_currentUser);
                    //_cartItems.set({widget.CartItem.product: simpleIntInput}, SetOptions(merge: true));

                  },
                  step: 1000,
                  buttonColor: Colors.black,
                  inputWidth: 150,
                  minValue: 1000,
                  maxValue: int.parse(widget.limit),
                ),
                Spacer(),
                SizedBox(
                  height: getproportionatescreenheight(20),
                ),
                ApplyButton(),
                SizedBox(
                  height: getproportionatescreenheight(20),
                ),
                // GestureDetector(
                //   onTap: () {},
                //   child: Text(
                //     'Buy Now with CoffeeFT',
                //     style: TextStyle(
                //         color: Colors.white,
                //         fontWeight: FontWeight.bold,
                //         fontSize: 16,
                //         decoration: TextDecoration.underline,
                //         decorationThickness: 3),
                //   ),
                // )
                Text(
                  'You are eligible',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      decorationThickness: 3),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Define a StatefulWidget class
class ApplyButton extends StatefulWidget {
  // Create the constructor
  const ApplyButton({Key? key}) : super(key: key);

  // Override the createState method
  @override
  _ApplyButtonState createState() => _ApplyButtonState();
}

// Define the state class
class _ApplyButtonState extends State<ApplyButton> {
  // Define a variable to store the text
  String _text = 'Apply';

  // Define a method to change the text
  void _changeText() {
    // Use setState to update the UI
    setState(() {
      // Check the current text and assign the new text accordingly
      if (_text == 'Apply') {
        _text = 'You have applied';
      } else {
        _text = 'Apply';
      }
    });
  }

  // Override the build method
  @override
  Widget build(BuildContext context) {
    // Return a GestureDetector widget
    return GestureDetector(
      // Set the onTap property to the _changeText method
      onTap: _changeText,
      // Set the child property to a Text widget
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(11),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
        ),
        child: Text(
          // Use the _text variable as the data
          _text,
          // Set the textAlign, style, color, fontSize, and fontWeight properties
          textAlign: TextAlign.center,
          style: TextStyle(
            color: darkgreen,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
