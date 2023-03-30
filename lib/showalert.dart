import 'package:flutter/material.dart';
Future<dynamic> showalert(
    {required BuildContext context,
      String? Title,
      String? Message,
      void Function()? Onpressed,
      String? Buttontext,bool visiblebutton=true}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(Title!), //"Location services for App are not enabled"
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(Message!)],
        ), //"To open App setting and enable Location access press Open App settings"
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Close alert")),
          Visibility(
            visible: visiblebutton,
            child: ElevatedButton(
                onPressed: Onpressed,
                child: Text(
                    Buttontext!)),
          ) /*()async{

      await Geolocator.openAppSettings();
    }*/
        ],
      ); //"Open app settings"
    },
  );
}
