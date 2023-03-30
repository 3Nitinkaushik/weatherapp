
import 'package:flutter/material.dart';
import 'topicon.dart';
import 'weahterby city.dart';
import 'weathercode.dart';
import 'network.dart';
import 'location.dart';


class Loadingscreen extends StatefulWidget {
   const Loadingscreen({required var this.data,Key? key}) : super(key: key);
final dynamic data;

  @override
  State<Loadingscreen> createState() => _LoadingscreenState();
}

class _LoadingscreenState extends State<Loadingscreen> {


 dynamic data;
 dynamic temp;
 dynamic city;
 dynamic id;
 late String emoji;
 late String condition;
 late ImageProvider image;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateui(widget.data);
  }
 void updateui(var data){
   setState(() {
     temp=data["main"]["temp"].toString();
     city=data["name"].toString();
     id=data["weather"][0]["id"];
     weathercode Weather=weathercode(id: id);
     Weather.giveid();
     emoji=Weather.getemoji();
     condition=Weather.getcondition();
     image=Weather.getimage();
   });
 }
  @override

  Widget build(BuildContext context) {





    return Scaffold(resizeToAvoidBottomInset: false,
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: image,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.6), BlendMode.dstATop),
          ),
        ),
        child: SafeArea(

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      topIcon(
                        icon: Icons.near_me,
                        align: Alignment.topLeft,
                        onpressed: ()async{
                          Location location = Location();
                          await location.getlocation(context);
                          double long = (location.long);
                          double lat = (location.lat);
                          network Network = network();


                          data=await Network.gettempbylocation(long: long, lat: lat);
                          updateui(data);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text("Near me",style: TextStyle(fontSize: 20),),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      topIcon(
                        icon: Icons.location_city,
                        align: Alignment.topRight,
                        onpressed: () {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => cityweather(data: data,)));
                        },
                      ),
                      Text("Find",style: TextStyle(fontSize: 20),)
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0, left: 30),
                child: Row(
                  children: [
                    Text(
                      "$temp° $emoji",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 80,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 40.0, left: 10, bottom: 65.0, right: 20),
                child: Text(
                  "Bring a $condition just in case in $city",
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 60),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
