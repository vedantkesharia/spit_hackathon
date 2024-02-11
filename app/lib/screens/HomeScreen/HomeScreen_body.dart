import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeeft/cards.dart';
import 'package:flutter/material.dart';
import 'package:coffeeft/constants.dart';
import 'package:coffeeft/screens/DetailsScreen/Details_Screen.dart';
import 'package:coffeeft/sizeconfig.dart';
import '../CartScreen/Cart_Screen.dart';
import '../MenuScreen/MenuScreen.dart';
import 'HomeScreen_Header.dart';
import 'HomeScreen_Banner.dart';
import 'package:coffeeft/Models/Products.dart';
import 'HomeScreen_Carousel.dart';
import 'HomeScreen_TextField.dart';
import 'Nft_balance.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //final _popular = FirebaseFirestore.instance.collection('popular');
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getproportionatescreenwidth(40),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeHeader(),
            SizedBox(
              height: getproportionatescreenheight(15),
            ),
            Balance(),
            SizedBox(
              height: getproportionatescreenheight(20),
            ),
            // TextFieldHome(),
            // Text(
            //   "Offers",
            //   style: TextStyle(
            //       color: darkgreen,
            //       fontSize: 18,
            //       fontWeight: FontWeight.bold),
            // ),
            HomeScreenBanner("Now get", "instant loans!"),
            SizedBox(
              height: getproportionatescreenheight(8),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular",
                  style: TextStyle(
                      color: darkgreen,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed((context), MenuScreen.id);
                  },
                  child: Text(
                    "See More",
                    style: kimptext.copyWith(
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getproportionatescreenheight(10),
            ),
            // StreamBuilder(
            //   stream: _popular.snapshots(),
            //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            //     if (snapshot.hasData) {
            //       return SingleChildScrollView(
            //         physics: BouncingScrollPhysics(),
            //         scrollDirection: Axis.horizontal,
            //         child: Row(
            //           children: [
            //             ...List.generate(
            //               snapshot.data!.docs.length,
            //               (index) {
            //                 final product = snapshot.data!.docs[index];
            //                 return Product_Carousel(
            //                 id: product['product_id'],
            //                 // onpress: () => Navigator.pushNamed(
            //                 //     context, DetailsPage.id,
            //                 //     arguments:
            //                 //         Productdetails_Args(product: Items[index]))),
            //               );}
            //             ),
            //           ],
            //         ),
            //       );
            //     }
            //     return CircularProgressIndicator();
            //   },
            // ),
            LoanCards(),
            SizedBox(
              height: getproportionatescreenheight(10),
            ),
          ],
        ),
      ),
    );
  }
}
