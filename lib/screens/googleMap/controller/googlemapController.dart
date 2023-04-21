
import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';


class GooglemapController extends GetxController
{
  RxDouble lat = 0.0.obs;
  RxDouble log = 0.0.obs;
  Rx<CameraPosition> Camera = CameraPosition(target: LatLng(21.0000,78.0000),zoom: 3).obs;
  Completer<GooglemapController> _controller = Completer();
  RxInt i = 0.obs;

  // RxList<Placemark> plist = <Placemark>[].obs;

  void currentLocation()
  async {

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    lat.value = position.latitude;
    log.value = position.longitude;

    changeCamera();
  }

  void changeCamera()
  {
    Camera.value = CameraPosition(target: LatLng(21.0000,78.0000),zoom: 11);
  }

  void onMapCreated(GoogleMapController controller)
  {
    _controller.complete(controller as FutureOr<GooglemapController>?);
  }

  void changeIndex(int index)
  {
    i = index as RxInt;
    print(i);
  }
}