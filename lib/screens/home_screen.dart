import 'package:fl_weather/components/weather_tile.dart';
import 'package:fl_weather/provider/weather_provider.dart';
import 'package:fl_weather/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/weather_api_call.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text(
          "Weather",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SearchScreen.routeName);
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Consumer<WeatherProvider>(builder: (buildContext, weatherProvider, child) =>
          weatherProvider.cities.isEmpty ? FutureBuilder(
              future: getDataByName(name: "Ahmedabad"),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  final city = snapshot.data;
                  return ListView(
                    children: [
                    WeatherTile(city: city)
                    ],
                );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                return const Center(child: CircularProgressIndicator());
                    }
                  }
                )
         : ListView.builder(
            itemBuilder: (ctx, index) {
              return WeatherTile(city: weatherProvider.cities[index]);
            },
            itemCount: weatherProvider.cities.length,
          )
      )
    );
  }
}


