import 'package:flutter/material.dart';
import 'package:coffeeft/constants.dart';
import 'package:coffeeft/screens/DetailsScreen/Details_Screen.dart';
import 'package:coffeeft/sizeconfig.dart';
import 'package:coffeeft/Models/Products.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getproportionatescreenwidth(40),
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: GridView.count(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(Items.length, (index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Items[index].imageurl),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Flexible(
                                  child: Text(
                                    '\$${Items[index].price}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                            ),
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Flexible(
                                child: Text(
                                  Items[index].name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15,
                                      shadows: [
                                        Shadow(
                                          // bottomLeft
                                            offset: Offset(-1.5, -1.5),
                                            color: Colors.black),
                                        Shadow(
                                          // bottomRight
                                            offset: Offset(1.5, -1.5),
                                            color: Colors.black),
                                        Shadow(
                                          // topRight
                                            offset: Offset(1.5, 1.5),
                                            color: Colors.black),
                                        Shadow(
                                          // topLeft
                                            offset: Offset(-1.5, 1.5),
                                            color: Colors.black),
                                      ]),
                                )),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            )));
  }
}
