import 'dart:async';

import 'package:coffeeft/constants.dart';
import 'package:flutter/material.dart';
import 'package:coffeeft/sizeconfig.dart';
class HomeScreenBanner extends StatefulWidget {
  late String intro;
  late String Mainline;
  HomeScreenBanner(this.intro, this.Mainline);

  @override
  State<HomeScreenBanner> createState() => _HomeScreenBannerState();
}

class _HomeScreenBannerState extends State<HomeScreenBanner> {
  int _currentpage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  late Timer _timer;
  int pagenumber = 0;


  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentpage < 3) {
        _currentpage++;
      } else {
        _currentpage = 0;
      }

      _pageController.animateToPage(_currentpage,
          duration: Duration(milliseconds: 370), curve: Curves.easeIn);
    });
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getproportionatescreenheight(150),
          child: PageView(
            onPageChanged: (value){
              setState(
                    () {
                      pagenumber = value;
                },
              );
            },
            controller: _pageController,
            children: [
              /* Don't forget to change the value in the slider as well if you change
              the number of items in this list. */
              buildContainers(
                1,
                  "Now get",
                  "instant loans!",
              ),
              buildContainers(
                2,
                "Increase your",
                "farming income!",),
              buildContainers(
                3,
                "Get zero",
                "interest EMIs",),
            ],

          ),
        ),
        SizedBox(height: getproportionatescreenheight(5),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) => buildContainer(index)),
        ),
      ],
    );
  }

  AnimatedContainer buildContainer(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.all(0.5),
            height: 10,
            width: pagenumber == index ? 25 : 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: pagenumber==index ? darkgreen : Colors.grey.shade400,
            ),
          );
  }

  Container buildContainers(int index, String intro, String Mainline) {
    return Container(
        height: getproportionatescreenheight(100),
        width: getproportionatescreenwidth(730),
        padding: EdgeInsets.symmetric(horizontal: getproportionatescreenwidth(20), vertical: getproportionatescreenheight(20)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage("assets/images/o$index.jpg"),
            fit: BoxFit.cover,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              intro,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                  shadows: [
                    Shadow( // bottomLeft
                        offset: Offset(-1.5, -1.5),
                        color: Colors.black
                    ),
                    Shadow( // bottomRight
                        offset: Offset(1.5, -1.5),
                        color: Colors.black
                    ),
                    Shadow( // topRight
                        offset: Offset(1.5, 1.5),
                        color: Colors.black
                    ),
                    Shadow( // topLeft
                        offset: Offset(-1.5, 1.5),
                        color: Colors.black
                    ),
                  ]
              ),
            ),
            Text(
              Mainline,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                  shadows: [
                    Shadow( // bottomLeft
                        offset: Offset(-1.5, -1.5),
                        color: Colors.black
                    ),
                    Shadow( // bottomRight
                        offset: Offset(1.5, -1.5),
                        color: Colors.black
                    ),
                    Shadow( // topRight
                        offset: Offset(1.5, 1.5),
                        color: Colors.black
                    ),
                    Shadow( // topLeft
                        offset: Offset(-1.5, 1.5),
                        color: Colors.black
                    ),
                  ]
              ),
            )
          ],
        ),
      );
  }
}
