import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'permission handling.dart';

class Location{
  double long=0;
  double lat=0;
  Future<void> getlocation(BuildContext context) async{

    try{Position position= await(determinePosition(context));
     long=position.longitude;
   lat=position.latitude;}catch(e){
     long=0;
     lat=0;
    }
  }

}