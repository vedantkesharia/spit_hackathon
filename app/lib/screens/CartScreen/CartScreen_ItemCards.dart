import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:coffeeft/sizeconfig.dart';
import 'package:coffeeft/Models/Cart_Data.dart';
import 'package:coffeeft/Models/Products.dart';
import 'package:quantity_input/quantity_input.dart';

class build_CartCards extends StatefulWidget {
  const build_CartCards({
    super.key,
    required this.CartItem,
  });

  final Cart CartItem;

  @override
  State<build_CartCards> createState() => _build_CartCardsState();
}

class _build_CartCardsState extends State<build_CartCards> {
  @override
  Widget build(BuildContext context) {
    final product = FirebaseFirestore.instance
        .collection('products')
        .doc(widget.CartItem.product);
    return FutureBuilder(
        future: product.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Get the data of the document as a map
            Map<String, dynamic>? productData = snapshot.data?.data();
            int simpleIntInput = widget.CartItem.quantity;
            return Container(
              margin: EdgeInsets.symmetric(
                  vertical: getproportionatescreenwidth(10)),
              padding: EdgeInsets.symmetric(
                  vertical: getproportionatescreenwidth(10),
                  horizontal: getproportionatescreenheight(10)),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  SizedBox(
                    width: getproportionatescreenwidth(265),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(productData!['imageurl']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getproportionatescreenwidth(20),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: getproportionatescreenwidth(500),
                          child: Text(
                            productData['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            softWrap: true,
                          ),
                        ),
                        SizedBox(
                          height: getproportionatescreenheight(10),
                        ),
                        Text(
                          "₹ ${productData['price']}",
                          style: TextStyle(
                            color: Colors.brown.shade700,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: getproportionatescreenheight(6),
                        ),
                        QuantityInput(
                          value: simpleIntInput,
                          onChanged: (value) {
                            print(value);
                            setState(() => simpleIntInput =
                                int.parse(value.replaceAll(',', '')));
                            final _currentUser = FirebaseAuth.instance.currentUser?.uid;
                            final _cartItems =
                            FirebaseFirestore.instance.collection('cart').doc(_currentUser);
                            _cartItems.set({widget.CartItem.product: simpleIntInput}, SetOptions(merge: true));

                          },
                          buttonColor: Colors.black,
                          inputWidth: 80,
                          maxValue: 200,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          return CircularProgressIndicator();
        });
  }
}
