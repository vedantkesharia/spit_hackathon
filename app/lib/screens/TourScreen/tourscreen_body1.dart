import 'package:coffeeft/constants.dart';
import 'package:coffeeft/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:coffeeft/screens/loginscreen/login_screen.dart';
import 'tourbody_component.dart';
import 'tourbody_component2.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offset;
  late Animation<Offset> _listoffset;
  late Animation<double> _opacity;
  int currpos = 0;
  final PageController controller = PageController();

  List<Map<String, String>> data = [
    {
      "imgno": "1",
      "text": "Helping Farmers\n earn more!",
    },
    {
      "imgno": "2",
      "text": "Best platform\n for money lending!",
    },
    {
      "imgno": "3",
      "text": "Help farmers, help the country!",
    }
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _controller.forward();
    _offset = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _listoffset = Tween<Offset>(
      begin: Offset(0.0, -1.0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _opacity = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: SlideTransition(
              position: _listoffset,
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  setState(
                    () {
                      currpos = value;
                    },
                  );
                },
                itemCount: data.length,
                itemBuilder: (context, index) =>
                    touchscreenbody(data[index]["imgno"], data[index]["text"]),
                physics: BouncingScrollPhysics(),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Row(
                  children: List.generate(
                    data.length,
                    (index) => buildContainer(index),
                  ),
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                FadeTransition(
                  opacity: _opacity,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15),
                      child: Text(
                        "Kisan Seva",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: darkgreen,
                            fontSize: 30
                        ),
                      ),
                    ),
                  ),
                ),
                SlideTransition(
                  position: _offset,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: Text(
                        "Farmer Loans, Made Easy",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ),
                ),
                FadeTransition(
                  opacity: _opacity,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Commonbutton(
                        "Start",
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Wrapper()),
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildContainer(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.all(5),
      height: 10,
      width: currpos == index ? 30 : 10,
      decoration: BoxDecoration(
        color: currpos == index ? darkgreen : Colors.grey.shade700,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
