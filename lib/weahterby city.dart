import 'package:flutter/material.dart';
import 'topicon.dart';
import 'weathercode.dart';
import 'network.dart';
class cityweather extends StatefulWidget {

   const cityweather({required var this.data,Key? key}) : super(key: key);
   final dynamic data;
  @override
  State<cityweather> createState() => _cityweatherState();
}

class _cityweatherState extends State<cityweather> {

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
    TextEditingController textController=TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  topIcon(
                    icon: Icons.near_me,
                    align: Alignment.topLeft,
                    onpressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10),
                child: TextField(controller: textController
                ,style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 50),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    hintText: "Enter city name",
                    hintStyle:
                        const TextStyle(fontSize: 50, fontWeight: FontWeight.bold,color: Colors.black38),
                  ),

                  onSubmitted: (text)async{

                    network Network = network();

                    data=await Network.gettempbycity(city: text);
updateui(data);
                  }),
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
