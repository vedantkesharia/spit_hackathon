import 'package:flutter/material.dart';
import 'package:coffeeft/constants.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimarycolor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            "Our Locations",
            style: TextStyle(
              color: darkgreen,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body:
            FlutterLocationPicker(
              initPosition: LatLong(50,50),
                initZoom: 11,
                minZoomLevel: 5,
                maxZoomLevel: 16,
                searchBarBackgroundColor: Colors.transparent,
                searchBarTextColor: Colors.black,
                zoomButtonsBackgroundColor: green,
                locationButtonBackgroundColor: green,
                selectLocationButtonStyle: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(green)),
                selectLocationTextColor: Colors.black,
                trackMyPosition: true,
                onPicked: (pickedData) {
                }));
  }
}
