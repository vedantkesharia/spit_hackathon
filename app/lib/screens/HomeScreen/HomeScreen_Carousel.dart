// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:coffeeft/screens/DetailsScreen/Details_Screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:coffeeft/sizeconfig.dart';
// import 'package:coffeeft/Models/Products.dart';
// import 'package:coffeeft/constants.dart';
//
// class Product_Carousel extends StatelessWidget {
//   Product_Carousel({
//     required this.id,
//     this.width = 350,
//     this.aspectRatio = 1,
//   });
//
//   late String id;
//   late double width, aspectRatio;
//   late GestureTapCallback onpress;
//
//   bool islike = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final _product = FirebaseFirestore.instance.collection('products').doc(id);
//     return StreamBuilder(
//         stream: _product.snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//           final product = snapshot.data!;
//           final productObject = Product(
//               name: product['name'],
//               description: product['description'],
//               price: product['price'],
//               imageurl: product['imageurl'],
//               id: product.id);
//           if (snapshot.hasData) {
//             return Container(
//               margin: EdgeInsets.only(right: getproportionatescreenwidth(15)),
//               padding: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                   color: Colors.grey.shade200,
//                   borderRadius: BorderRadius.circular(20)),
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               DetailsPage(image:,)));
//                 },
//                 child: SizedBox(
//                   width: getproportionatescreenwidth(width),
//                   child: Column(
//                     children: [
//                       AspectRatio(
//                         aspectRatio: aspectRatio,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: Colors.grey.shade400,
//                             image: DecorationImage(
//                               image: NetworkImage(product['imageurl']),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: getproportionatescreenheight(5),
//                       ),
//                       Text(
//                         product['name'],
//                         style: kimptext.copyWith(
//                             fontWeight: FontWeight.bold, fontSize: 15),
//                         maxLines: 2,
//                       ),
//                       SizedBox(
//                         height: getproportionatescreenheight(10),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "₹ ${product['price']}\n${product['nft']} CFT",
//                             style: TextStyle(
//                                 color: Colors.brown.shade700,
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           Container(
//                               alignment: Alignment.center,
//                               height: getproportionatescreenheight(35),
//                               width: getproportionatescreenwidth(85),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                                 color: Colors.black,
//                               ),
//                               child: AddToCartButton(product: product.id,))
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }
//           return CircularProgressIndicator();
//         });
//   }
// }
//
// class AddToCartButton extends StatefulWidget {
//   const AddToCartButton({
//     super.key,
//     required this.product,
//   });
//
//   final product;
//
//
//   @override
//   State<AddToCartButton> createState() => _AddToCartButtonState();
// }
//
// class _AddToCartButtonState extends State<AddToCartButton> {
//   @override
//   Widget build(BuildContext context) {
//     final _currentUser = FirebaseAuth.instance.currentUser?.uid;
//     final _cartItems =
//     FirebaseFirestore.instance.collection('cart').doc(_currentUser);
//
//     return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//       future: _cartItems.get(),
//       builder: (_, snapshot) {
//         if (snapshot.hasData) {
//           final data = snapshot.data!.data();
//           final value = data![widget.product];
//           if(value != null) {
//             return IconButton(
//                 onPressed: () {
//                   _cartItems.update({widget.product: FieldValue.delete()});
//                   print('removed from cart');
//                   setState(() {});
//                 },
//                 icon: Icon(
//                   Icons.remove_shopping_cart,
//                   color: Colors.white,
//                   size: 25,
//                 ));
//           }
//           return IconButton(
//               onPressed: () {
//                 _cartItems.set({widget.product: 1}, SetOptions(merge: true));
//                 print('added cart');
//                 setState(() {});
//               },
//               icon: Icon(
//                 Icons.add_shopping_cart,
//                 color: Colors.white,
//                 size: 25,
//               ));
//         }
//         return IconButton(
//             onPressed: () {
//             },
//             icon: Icon(
//               Icons.add_shopping_cart,
//               color: Colors.white,
//               size: 25,
//             ));
//       },
//     );
//   }
// }
