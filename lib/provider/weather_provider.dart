import 'package:fl_weather/api/weather_api_call.dart';
import 'package:fl_weather/components/weather_tile.dart';
import 'package:fl_weather/db/sqlite_db.dart';
import 'package:fl_weather/model/city_data/city_data.dart';
import 'package:fl_weather/model/city_weather_data/city_weather_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherProvider extends ChangeNotifier{

  List<CityWeatherData> cities = [

  ];

  void addCity(CityWeatherData city){
   cities.add(city);
   notifyListeners();
  }

  void removeCity(CityWeatherData city){
    cities.remove(city);
    notifyListeners();
  }

  Widget returnSearch(String cityName){
    if(cityName.isEmpty){
      return const Center(child: Text("Nothing to show yet!"),);
    }
    else if(cityName.isNotEmpty){
      return FutureBuilder(
          future: getDataByName(name: cityName),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            final city = snapshot.data;
            if (snapshot.hasData) {
              return WeatherTile(city: city);
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()),);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          });
    }
    else{
      return const Center(child: Text("An error occurred"),);
    }
  }

}