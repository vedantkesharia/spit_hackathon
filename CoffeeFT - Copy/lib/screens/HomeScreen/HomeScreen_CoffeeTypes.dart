import 'package:flutter/material.dart';
import 'package:coffeeft/sizeconfig.dart';
class CoffeeTypes extends StatelessWidget {
  const CoffeeTypes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getproportionatescreenheight(120),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            buildTypes("Cappucino", "Blends in every mood!", 1),
            SizedBox(
              width: getproportionatescreenwidth(10),
            ),
            buildTypes("Expresso", "Energy Supplier!", 2),
            SizedBox(
              width: getproportionatescreenwidth(10),
            ),
            buildTypes("Cortado", "Finely Steamed", 3),
            SizedBox(
              width: getproportionatescreenwidth(10),
            ),
            buildTypes("Drip Coffee", "Tastes Premium everytime!", 4),
            SizedBox(
              width: getproportionatescreenwidth(10),
            ),
            buildTypes("Decaf", "For less Caffeine lovers!", 5),
          ],
        ),
      ),
    );
  }

  Container buildTypes(String Mainline, String Tagline, int image) {
    return Container(
          decoration: BoxDecoration(
            // error here
            // image: DecorationImage(
            //   fit: BoxFit.cover,
            //   image: AssetImage("assets/images/o${image.toString()}.png"),
            // ),
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
          ),
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 15,),
                child: Text(
                  Mainline,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5,),
                child: Text(
                  Tagline,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
        );
  }
}
