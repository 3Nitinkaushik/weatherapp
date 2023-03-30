import 'package:flutter/material.dart';
import 'loadingwork.dart';
import 'package:flutter/services.dart';
void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(
     MaterialApp(
       theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,

      home: const loadingwork(),),
  );
}
