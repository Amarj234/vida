import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../model/getlocation_model.dart';

class GetLocation {
  double? lat;
  double? long;
  String address = "";
  String? travellwith;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<LocationModel?> getLatLong() async {
    Position data = await _determinePosition();

    LocationModel? model = await getAddress(data.latitude, data.longitude);
    return model;
  }

  Future<LocationModel>? getAddress(lat, long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    // for (int i = 0; i < placemarks.length; i++) {
    //   print("INDEX $i ${placemarks[i]}");
    // }
    return LocationModel(
        lat: lat,
        long: long,
        locationname:
            " ${placemarks[0].thoroughfare!} ${placemarks[0].locality!} ${placemarks[0].subLocality!} ${placemarks[0].name!} ${placemarks[0].country!} ${placemarks[0].postalCode!}");
  }
}
