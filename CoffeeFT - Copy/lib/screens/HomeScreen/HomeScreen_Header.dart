import 'package:flutter/material.dart';
import 'package:coffeeft/screens/CartScreen/Cart_Screen.dart';
import 'package:coffeeft/sizeconfig.dart';
import 'HomeScreen_TextField.dart';
import 'HomeScreen_IconButtons.dart';
import 'package:coffeeft/screens/MapScreen/MapScreen.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          MapLocation(),
          Essentials(Icons.credit_score_outlined, 0, () {
            Navigator.pushNamed((context), CartScreen.id);
          }),
          SizedBox(
            width: getproportionatescreenwidth(10),
          ),
          Essentials(Icons.notifications_none_outlined, 4, () {}),
        ],
      ),
    );
  }
}

class MapLocation extends StatelessWidget {
  const MapLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MapScreen(),
                  ),
                );
              },
              icon: Icon(Icons.location_on_rounded)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kandivali East',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              Text(
                'Mumbai, India',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
