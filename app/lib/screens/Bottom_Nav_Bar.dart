import 'package:flutter/material.dart';
import 'package:coffeeft/constants.dart';
import 'package:coffeeft/screens/ProfileScreen/Profile_Screen.dart';
import 'package:coffeeft/screens/CartScreen/Cart_Screen.dart';
import 'package:coffeeft/screens/HomeScreen/Home_Screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:coffeeft/sizeconfig.dart';
import 'package:coffeeft/screens/MenuScreen/MenuScreen.dart';


class Bottom_Nav extends StatefulWidget {
  const Bottom_Nav({Key? key}) : super(key: key);

  static const String id = "Bottom_Nav";

  @override
  State<Bottom_Nav> createState() => _Bottom_NavState();
}

class _Bottom_NavState extends State<Bottom_Nav> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    Home_Screen(),
    MenuScreen(),
    CartScreen(),
    Profile_Screen(),
  ];

  void _onitemtapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimarycolor,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getproportionatescreenwidth(20),
          vertical: getproportionatescreenheight(10),
        ),
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: darkgreen,
        ),
        child: GNav(
          backgroundColor: darkgreen,
          color: Colors.white,
          activeColor: Colors.white,
          gap: 8,
          tabBackgroundColor: Color(0xff406c5d),
          padding: EdgeInsets.all(12),
          selectedIndex: _selectedIndex,
          onTabChange: _onitemtapped,
          tabs: [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.account_balance,
              text: "Apply",
            ),
            GButton(
              icon: Icons.credit_score,
              text: "Loans",
            ),
            // GButton(
            //   icon: Icons.favorite_border,
            //   text: "Likes",
            // ),
            GButton(
              icon: Icons.person,
              text: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}


