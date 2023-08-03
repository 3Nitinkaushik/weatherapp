

import 'package:flutter/material.dart';

import 'showalert.dart';
import 'package:geolocator/geolocator.dart';
Future<Position> determinePosition(context) async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    //"Location services are not enabled"
    //"To open Location Setting press Open settings"
    //"Open settings"
    /*() async {
                  await Geolocator.openLocationSettings();
                }*/
    showalert(context: context,Title:"Location services are not enabled",Message: "To open Location Setting press Open settings",Onpressed:() async{
      await Geolocator.openLocationSettings();
      Navigator.pop(context);

    },Buttontext: "Open settings");
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

      showalert(
          context: context,
          Title: "Location services for App are not enabled",
          Message:
          "To open App setting and enable Location access press Open App settings",
          Onpressed: ()async{
            await Geolocator.openAppSettings();

            Navigator.pop(context);
          },Buttontext:"Open app settings" );

    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    showalert(
        context: context,
        Title: "Location services for App are not enabled",
        Message:
        "To open App setting and enable Location access press Open App settings",
        Onpressed: ()async{

          await Geolocator.openAppSettings();
          Navigator.pop(context);

        },Buttontext:"Open app settings" );
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  final position= await Geolocator.getCurrentPosition(forceAndroidLocationManager: true,
    desiredAccuracy: LocationAccuracy.best);

  return position;
}

