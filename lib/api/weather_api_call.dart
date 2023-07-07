import 'dart:convert';

import 'package:fl_weather/model/city_data/city_data.dart';
import 'package:fl_weather/model/city_weather_data/city_weather_data.dart';
import 'package:http/http.dart' as http;


//Function to get coordinates of a city by name
Future<City> getCords({String cityName = "ahmedabad"}) async{
  try{
    final response = await http.get(Uri.parse('https://api.openweathermap.org/geo/1.0/direct?q=$cityName&limit=5&appid='));
    final List<dynamic> fData = jsonDecode(response.body);
    final Map<String, dynamic> data = fData.first;
    return City(name: data['name'], lat: data['lat'], lon: data['lon']);
  } on Exception catch(_){
    rethrow;
  }
}


//Function to get weather data of a city by given lat and lon coordinates
Future<CityWeatherData> getWeatherData({required double lat, required double lon}) async{
  try{
    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?units=metric&lat=$lat&lon=$lon&appid='));
    final Map<String, dynamic> data = jsonDecode(response.body);
    return CityWeatherData(
        temp: data['main']['temp'],
        feels_like: data['main']['feels_like'],
        minTemp: data['main']['temp_min'],
        maxTemp: data['main']['temp_max'],
        pressure: data['main']['pressure'],
        humidity: data['main']['humidity'],
      name: data['name']
    );
  } on Exception catch(_){
    rethrow;
  }
}

Future<CityWeatherData> getDataByName({required String name}) async{
  try{
    final City city = await getCords(cityName: name);
    final weatherData = await getWeatherData(lat: city.lat, lon: city.lon);
    return weatherData;
  } on Exception catch(_){
    rethrow;
  }
}
