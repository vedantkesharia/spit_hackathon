import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeeft/Models/Cart_Data.dart';
import 'package:coffeeft/constants.dart';
import 'package:coffeeft/services/api_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:coffeeft/sizeconfig.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CheckOutCard extends StatelessWidget {
  const CheckOutCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Api = ApiService();
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getproportionatescreenwidth(50),
        vertical: getproportionatescreenwidth(50),
      ),
      decoration: BoxDecoration(
        color: darkgreen,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: FutureBuilder(
          future: Api.getCartProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final items = snapshot.data;
              int subtotal = 0;
              for (var item in items!) {
                subtotal += item as int;
              }
              double taxes = subtotal * 0.02;
              double total = subtotal + taxes;

              return Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Land Loan',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: getproportionatescreenwidth(20),
                      ),
                      Spacer(),
                      Text(
                        "₹ 1000",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: getproportionatescreenheight(10),
                  ),
                  Row(
                    children: [
                      Text(
                        'Machine Loan',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: getproportionatescreenwidth(20),
                      ),
                      Spacer(),
                      Text(
                        "₹ 500",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: getproportionatescreenheight(10),
                  ),
                  Row(
                    children: [
                      Text(
                        'Weather Insurance',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: getproportionatescreenwidth(20),
                      ),
                      Spacer(),
                      Text(
                        "₹ 1000",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: getproportionatescreenheight(10),
                  ),
                  Row(
                    children: [
                      Text(
                        'Subtotal',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        "₹ 2000",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: getproportionatescreenheight(10),
                  ),
                  Row(
                    children: [
                      Text(
                        'Taxes',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        "₹ 28.0",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: getproportionatescreenheight(6),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: getproportionatescreenheight(6),
                  ),
                  Row(
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        "₹ 2028",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: getproportionatescreenheight(20),
                  ),
                  Spacer(),
                  PayButton(
                    amount: total,
                  ),
                  SizedBox(
                    height: getproportionatescreenheight(20),
                  ),
                ],
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}

class CollapsedCard extends StatelessWidget {
  const CollapsedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getproportionatescreenwidth(50),
        vertical: getproportionatescreenwidth(50),
      ),
      decoration: BoxDecoration(
        color: darkgreen,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Text(
            'View Due Bills',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Icon(
            Icons.swipe_up_rounded,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class CartItems extends StatefulWidget {
  const CartItems({Key? key}) : super(key: key);

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    final _currentUser = FirebaseAuth.instance.currentUser?.uid;
    final _cartItems =
        FirebaseFirestore.instance.collection('cart').doc(_currentUser);
    return StreamBuilder(
        stream: _cartItems.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("has data");
            Map<String, dynamic>? cartData = snapshot.data?.data();
            if (cartData == null) {
              return Text(
                'Nothing in Cart',
                style: TextStyle(color: Colors.white),
              );
            }

            List<Cart> items = cartData?.entries
                    .map((entry) => Cart(
                          product: entry.key,
                          quantity: entry.value,
                        ))
                    .toList() ??
                [];

            List<Widget> cartWidgets = items
                .map((item) => CartRow(
                      CartItem: item,
                    ))
                .toList();
            cartWidgets = cartWidgets.expand((widget) {
              // Use the indexOf method to get the position of the widget in the list
              int index = cartWidgets.indexOf(widget);
              // If the widget is not the last one, return a list with the widget and a SizedBox
              if (index < cartWidgets.length - 1) {
                return [
                  widget,
                  SizedBox(height: getproportionatescreenheight(10))
                ];
              }
              // If the widget is the last one, return a list with only the widget
              else {
                return [widget];
              }
            }).toList();
            return Column(children: cartWidgets);
          }
          return CircularProgressIndicator();
        });
  }
}

class CartRow extends StatefulWidget {
  const CartRow({
    super.key,
    required this.CartItem,
  });

  final CartItem;

  @override
  State<CartRow> createState() => _CartRowState();
}

class _CartRowState extends State<CartRow> {
  @override
  Widget build(BuildContext context) {
    final product = FirebaseFirestore.instance
        .collection('products')
        .doc(widget.CartItem.product);
    int total = 0;
    return FutureBuilder(
        future: product.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Get the data of the document as a map
            Map<String, dynamic>? productData = snapshot.data?.data();
            return Row(
              children: [
                Text(
                  productData!['name'],
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: getproportionatescreenwidth(20),
                ),
                Text(
                  "x" + widget.CartItem.quantity.toString(),
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                Text(
                  "₹ " + productData['price'].toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            );
          }
          return CircularProgressIndicator();
        });
  }
}

class PayButton extends StatefulWidget {
  final amount;
  PayButton({
    super.key,
    required this.amount,
  });

  @override
  State<PayButton> createState() => _PayButtonState();
}

class _PayButtonState extends State<PayButton> {
  late Razorpay razorpay;

  void initState() {
    super.initState();

    razorpay = new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerPaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void handlerPaymentSuccess() {
    print('success');
  }

  void handlerPaymentError() {
    print('error');
  }

  void handlerExternalWallet() {
    print('external');
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_svltJ0ARsmzxdg",
      "amount": 202800,
      "name": "Payment",
      "description": "pay premium",
      "prefill": {"contact": "2323232323", "email": "shdjsdh@gmail.com"},
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
        ),
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(
            'Pay Due Bills',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: darkgreen,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      onTap: () {
        openCheckout();
      },
    );
  }
}

class PayWithNFT extends StatelessWidget {
  const PayWithNFT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        'Pay with CoffeeFT',
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            decoration: TextDecoration.underline,
            decorationThickness: 3),
      ),
    );
  }
}

class CollapsedCard extends StatelessWidget {
  const CollapsedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Api = ApiService();
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getproportionatescreenwidth(50),
        vertical: getproportionatescreenwidth(50),
      ),
      decoration: BoxDecoration(
        color: darkgreen,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Text(
            'View Due Bills',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Icon(
            Icons.swipe_up_rounded,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class CartItems extends StatefulWidget {
  const CartItems({Key? key}) : super(key: key);

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    final _currentUser = FirebaseAuth.instance.currentUser?.uid;
    final _cartItems =
        FirebaseFirestore.instance.collection('cart').doc(_currentUser);
    return StreamBuilder(
        stream: _cartItems.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("has data");
            Map<String, dynamic>? cartData = snapshot.data?.data();
            if (cartData == null) {
              return Text(
                'Nothing in Cart',
                style: TextStyle(color: Colors.white),
              );
            }

            List<Cart> items = cartData?.entries
                    .map((entry) => Cart(
                          product: entry.key,
                          quantity: entry.value,
                        ))
                    .toList() ??
                [];

            List<Widget> cartWidgets = items
                .map((item) => CartRow(
                      CartItem: item,
                    ))
                .toList();
            cartWidgets = cartWidgets.expand((widget) {
              // Use the indexOf method to get the position of the widget in the list
              int index = cartWidgets.indexOf(widget);
              // If the widget is not the last one, return a list with the widget and a SizedBox
              if (index < cartWidgets.length - 1) {
                return [
                  widget,
                  SizedBox(height: getproportionatescreenheight(10))
                ];
              }
              // If the widget is the last one, return a list with only the widget
              else {
                return [widget];
              }
            }).toList();
            return Column(children: cartWidgets);
          }
          return CircularProgressIndicator();
        });
  }
}

class CartRow extends StatefulWidget {
  const CartRow({
    super.key,
    required this.CartItem,
  });

  final CartItem;

  @override
  State<CartRow> createState() => _CartRowState();
}

class _CartRowState extends State<CartRow> {
  @override
  Widget build(BuildContext context) {
    final product = FirebaseFirestore.instance
        .collection('products')
        .doc(widget.CartItem.product);
    int total = 0;
    return FutureBuilder(
        future: product.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Get the data of the document as a map
            Map<String, dynamic>? productData = snapshot.data?.data();
            return Row(
              children: [
                Text(
                  productData!['name'],
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: getproportionatescreenwidth(20),
                ),
                Text(
                  "x" + widget.CartItem.quantity.toString(),
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                Text(
                  "₹ " + productData['price'].toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            );
          }
          return CircularProgressIndicator();
        });
  }
}
