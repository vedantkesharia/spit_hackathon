import 'package:flutter/material.dart';
import 'package:coffeeft/sizeconfig.dart';

class Image_Preview extends StatefulWidget {
  const Image_Preview({
    super.key,
    required this.imageurl,
  });

  final imageurl;

  @override
  State<Image_Preview> createState() => _Image_PreviewState();
}

class _Image_PreviewState extends State<Image_Preview> {

  @override
  Widget build(BuildContext context) {
    print(widget.imageurl);
    return SizedBox(
      //height: getproportionatescreenheight(300),
      width: double.infinity,
      child: Image.asset(widget.imageurl),
    );
  }
}