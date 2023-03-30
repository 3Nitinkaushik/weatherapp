import 'package:flutter/material.dart';
import 'location.dart';
import 'network.dart';
import 'package:wheather_app/Loadingscreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class loadingwork extends StatefulWidget {
  const loadingwork({Key? key}) : super(key: key);

  @override
  State<loadingwork> createState() => _loadingworkState();

}

class _loadingworkState extends State<loadingwork> {

  @override

  void initState() {
    super.initState();
    getlocation();




    // TODO: implement initState
  }

  void getlocation() async {
    Location location = Location();
    await location.getlocation(context);
    double long = (location.long);
    double lat = (location.lat);
    network Network = network();
    var data=await Network.gettempbylocation(long: long, lat: lat);
    if(context.mounted){Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Loadingscreen(data: data,)),
    );
  }}


  @override

  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        )
      ),
    );
  }
}
