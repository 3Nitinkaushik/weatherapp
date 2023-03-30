import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'permission handling.dart';

class Location{
  late double long;
  late double lat ;
  Future<void> getlocation(BuildContext context) async{
    try{Position position= await(determinePosition(context));
     long=position.longitude;
   lat=position.latitude;}catch(e){
     long=0;
     lat=0;
    }
  }

}