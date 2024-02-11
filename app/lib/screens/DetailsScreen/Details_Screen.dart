import 'package:flutter/material.dart';
import 'package:coffeeft/constants.dart';
import 'DetailsScreen_Body.dart';


class DetailsPage extends StatefulWidget {
  DetailsPage({
    super.key,
    required this.image,
    this.name,
    this.limit
  });
  final image;
  final name;
  final limit;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: kPrimarycolor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
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
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Body(
          image: widget.image,
          name: widget.name,
          limit: widget.limit,
        ),
      ),
    );
  }
}

