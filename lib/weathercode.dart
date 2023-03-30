import 'package:flutter/material.dart';

class weathercode{
  weathercode({required int this.id});
  int id;
  String _condition="";
  String _emoji="";
  ImageProvider _image=AssetImage("Images/Other.jpg");

  void giveid(){
  if(id<300){
    _condition="🥼";
    _emoji="🌩️";
    _image=AssetImage("Images/Thunder.jpg");
  }
  else if(id<400){
    _condition="☔";
    _emoji="🌦️";
    _image=AssetImage("Images/Drizzel.jpg");
  }
  else if(id<600){
    _condition="🧥";
    _emoji="⛈";
    _image=AssetImage("Images/Rain.jpg");
  }
  else if(id<700){
    _condition="🥼🧣";
    _emoji="❄️";
    _image=AssetImage("Images/Snow.jpg");
  }
  //☀️🌤️⛅🌥️☁️🌦️🌧️⛈️🌩️🌨️❄️🌬️💨🌫️
  //🧥👕🧣🧤🩳
  else if(id<800){
    _condition="👕";
    _emoji="🌬️";
    _image=AssetImage("Images/Other.jpg");
  }
  else if(id==800){
    _condition="👕";
    _emoji="☀️";
    _image=AssetImage("Images/Clear.jpg");
  }
  else if(id<900){
    _emoji="🌫️";
    _condition="🧣";
    _image=AssetImage("Images/Clouds.jpg");
  }
  else{
    _emoji="💨";
    _condition="🩳";
    _image=AssetImage("Images/Other.jpg");
  }

  }
  String getemoji(){
    return _emoji;
  }
  String getcondition(){
    return _condition;
  }
  ImageProvider getimage(){
    return _image;
  }

}