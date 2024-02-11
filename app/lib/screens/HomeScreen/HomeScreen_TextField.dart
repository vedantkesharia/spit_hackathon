import 'package:flutter/material.dart';
import 'package:coffeeft/constants.dart';
import 'package:coffeeft/sizeconfig.dart';
class TextFieldHome extends StatelessWidget {
  const TextFieldHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getproportionatescreenheight(60),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextField(
        textInputAction: TextInputAction.next,
        onSubmitted: (value){
          FocusScope.of(context).unfocus();
        },
        autofocus: false,
        style: kimptext.copyWith(fontSize: 20),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: getproportionatescreenheight(30),
            horizontal: getproportionatescreenwidth(10),
          ),
          icon: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(Icons.search),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          hintText: "Search your Coffee",
          hintStyle: kimptext.copyWith(fontSize: 15),
        ),
      ),
    );
  }
}

