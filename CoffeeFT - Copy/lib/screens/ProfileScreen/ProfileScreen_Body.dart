import 'package:coffeeft/constants.dart';
import 'package:coffeeft/screens/CibilScreen/cibil.dart';
import 'package:coffeeft/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:coffeeft/sizeconfig.dart';
import 'package:coffeeft/services/auth_service.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getproportionatescreenwidth(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: getproportionatescreenheight(40),
                ),
                CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.brown,
                  backgroundImage: AssetImage("assets/images/sample.jpg"),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade900,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getproportionatescreenheight(40),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CibilScreen(),
                        ));
                  },
                  child: build_ProfileTiles(
                    TileTitle: "My Cibil Score",
                    leading: Icons.person,
                  ),
                ),
                build_ProfileTiles(
                  TileTitle: "Notifications",
                  leading: Icons.notifications,
                ),
                build_ProfileTiles(
                  TileTitle: "Settings",
                  leading: Icons.settings,
                ),
                build_ProfileTiles(
                  TileTitle: "Contact Us",
                  leading: Icons.help,
                ),
                GestureDetector(
                  onTap: () async {
                    await auth.signOut();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Wrapper()),
                    );
                  },
                  child: build_ProfileTiles(
                    TileTitle: "Sign Out",
                    leading: Icons.logout,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class build_ProfileTiles extends StatelessWidget {
  const build_ProfileTiles({
    super.key,
    required this.TileTitle,
    required this.leading,
  });

  final String TileTitle;
  final IconData leading;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      height: getproportionatescreenheight(60),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: Icon(
          leading,
          color: darkgreen,
          size: 30,
        ),
        title: Text(
          TileTitle,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.grey.shade500,
          size: 15,
        ),
      ),
    );
  }
}
