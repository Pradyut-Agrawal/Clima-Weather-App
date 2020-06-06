import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';


const  apikey = '8375d0e59ed2c47f1121653f6d8b1972';
class WeatherModel {
 Future<dynamic> gettypedweather(String typed)async{

   String url = 'https://api.openweathermap.org/data/2.5/weather?q=$typed&appid=$apikey&units=metric' ;
   NetworkHelper net =  NetworkHelper(url) ; 
   var weatherdata = await net.getdata() ; 
   return weatherdata;
 }
  Future<dynamic>getlocationweather()async{
    Location locate = new Location(); 
     await locate.getlocation(); 
    double latitude = (locate.latitude) ; 
    double  longitude = (locate.longitude) ; 
     NetworkHelper network = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey&units=metric');
     var weatherdata = await network.getdata();
     return weatherdata ;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
