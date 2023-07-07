import 'package:fl_weather/db/sqlite_db.dart';
import 'package:fl_weather/model/city_data/city_data.dart';
import 'package:fl_weather/model/city_weather_data/city_weather_data.dart';
import 'package:fl_weather/provider/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherTile extends StatelessWidget {
  CityWeatherData city;
  WeatherTile({required this.city, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        title: Text(city.name, style: const TextStyle(fontWeight: FontWeight.bold),),
        trailing: Text(city.temp.toString(), style: const TextStyle(fontSize: 17),),
        subtitle: Wrap(
          spacing: 20, runSpacing: 10,
          children: <Widget>[
            const Text("Min temp:"),
            Text(city.minTemp.toString()),
            const Text("Max temp:"),
            Text(city.maxTemp.toString()),
            const Text("Pressure:"),
            Text(city.pressure.toString()),
            const Text("Humidity:"),
            Text(city.humidity.toString())
          ],
        ),
        onTap: () {
          Provider.of<WeatherProvider>(context, listen: false).removeCity(city);
        },
        onLongPress: (){
          Provider.of<WeatherProvider>(context, listen: false).removeCity(city);
        },
      ),
    );
  }
}
