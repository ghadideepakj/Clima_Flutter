import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  late double lattitude;
  late double longitude;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      lattitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
