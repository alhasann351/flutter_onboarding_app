import 'dart:async';

import 'package:flutter_onboarding_app/constants/app_string.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  var locationText = AppString.locationText.obs;

  Future<void> fetchLocationOnce() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        locationText.value = AppString.locationServiceText;
        await Geolocator.openLocationSettings();
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          locationText.value = AppString.locationPermissionDeniedText;
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        locationText.value = AppString.locationPermissionDeniedForeverText;
        await Geolocator.openAppSettings();
        return;
      }

      final LocationSettings locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );

      List<Placemark> placeMarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placeMarks.isNotEmpty) {
        Placemark place = placeMarks.first;
        locationText.value =
            "${place.subLocality}, ${place.locality}, ${place.country}";
      } else {
        locationText.value = AppString.addressNotFoundText;
      }
    } catch (e) {
      locationText.value = "${AppString.error}: $e";
    }
  }
}
