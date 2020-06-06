import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{

    String url ; 
    NetworkHelper(this.url) ; 

     Future getdata() async{

     http.Response response = await http.get(url) ;
     if(response.statusCode==200)
   {     
           return jsonDecode(response.body); 
         
   }
      else
     print(response.statusCode) ;
  }

}