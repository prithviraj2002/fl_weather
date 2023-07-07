import 'package:flutter/material.dart';

import '../model/city_data/city_data.dart';

class CityTile extends StatelessWidget {
  final City city;
  const CityTile({required this.city, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(city.name),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Text("Longitude: "),
          Text(city.lat.toString()),
          const Text("Latitude: "),
          Text(city.lon.toString())
        ],
      ),
    );
  }
}
