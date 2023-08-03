
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class network {
  dynamic temp;
  Future gettempbylocation({required double long,required double lat}) async{

    var url=Uri.https('api.openweathermap.org','/data/2.5/weather',{'lon':'$long','lat':'$lat','units':'metric','appid':'6a1efbda172d2c1f6cfa96e94bd0fded'});
    var response =await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) ;

        temp=jsonResponse;

      return temp;
      }
    else{
      temp="Networ error";
      return temp;
    }

  }
  Future gettempbycity({required String city}) async{
    var url=Uri.https('api.openweathermap.org','/data/2.5/weather',{'q':'$city','units':'metric','appid':'6a1efbda172d2c1f6cfa96e94bd0fded'});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) ;

      temp=jsonResponse;
      return temp;
    }
    else{
      temp="Networ error";
      return temp;
    }
  }
}