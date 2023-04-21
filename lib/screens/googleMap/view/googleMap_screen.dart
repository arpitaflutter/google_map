import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controller/googlemapController.dart';

class googlemapScreen extends StatefulWidget {
  const googlemapScreen({Key? key}) : super(key: key);

  @override
  State<googlemapScreen> createState() => _googlemapScreenState();
}

class _googlemapScreenState extends State<googlemapScreen> {
  GooglemapController? googleMapController = Get.put(GooglemapController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Google Map"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: GoogleMap(
          onMapCreated: googleMapController?.onMapCreated,
          initialCameraPosition: googleMapController!.Camera.value,
          // mapType: MapType.satellite,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          // mapType: MapType.hybrid,
        ),
      ),
    );
  }
}
