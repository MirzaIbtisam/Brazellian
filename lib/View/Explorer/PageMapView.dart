import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'DetailsRealEstate.dart';

class ExplorePageMapView extends StatefulWidget {
  const ExplorePageMapView({Key? key}) : super(key: key);

  @override
  State<ExplorePageMapView> createState() => _ExplorePageMapViewState();
}

class _ExplorePageMapViewState extends State<ExplorePageMapView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  final List<String> locationcategories = [
    "All",
    "Events",
    "Real Estate",
    "Shop",
    "Services",
    "Jobs",
    "Vehicles",
  ];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Padding(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffececec),
                  borderRadius: BorderRadius.circular(100),
                ),
                height: 50,
                width: 50,
                child: SvgPicture.asset(
                  "assets/back arrow.svg",
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Text(
              "Explorar",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 30,
            )
          ],
        ),
      ),
      Expanded(
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    ]));
  }

  Widget categories(String category, bool isSelected, Function(bool) onSelect) {
    return Container(
      height: 15,
      width: category == "Real Estate" ? 90 : 70,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
            color: isSelected ? Color(0xff78828a) : Color(0xff78828a),
            width: 1.5),
        color: isSelected ? Color(0xff78828a) : Colors.white,
      ),
      child: InkWell(
        onTap: () {
          onSelect(!isSelected);
        },
        child: Align(
          alignment: Alignment.center,
          child: Text(
            category,
            style: TextStyle(
                color: isSelected ? Colors.white : Color(0xff78828A),
                fontSize: 11),
          ),
        ),
      ),
    );
  }
}
