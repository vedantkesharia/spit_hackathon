import 'package:flutter/material.dart';
import 'package:coffeeft/sizeconfig.dart';
class Essentials extends StatelessWidget {
  late IconData icon;
  late int number;
  late VoidCallback Press;

  Essentials(this.icon, this.number, this.Press);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      splashColor: Colors.grey,

      onTap: Press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: getproportionatescreenwidth(120),
            height: getproportionatescreenheight(65),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              color: Colors.grey.shade600,
            ),
          ),
          if(number!=0)
            Positioned(
              right: 0,
              top: -9,
              child: Container(
                child: Center(child: Text(number.toString(), style: TextStyle(color: Colors.white, fontSize: 10,),)),
                width: getproportionatescreenwidth(40),
                height: getproportionatescreenheight(40),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.shade900,
                  border: Border.all(width: 1.0, color: Colors.red.shade200),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
