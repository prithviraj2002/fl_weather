import 'package:fl_weather/api/weather_api_call.dart';
import 'package:fl_weather/components/weather_tile.dart';
import 'package:fl_weather/provider/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = "/search-screen";
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController _search = TextEditingController();
  bool search = false;


  @override
  void dispose() {
    // TODO: implement dispose
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text(
          "Enter your city",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<WeatherProvider>(
        builder: (buildContext, weatherProvider, child) => Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _search,
                decoration: InputDecoration(
                  labelText: "Search City",
                  hintText: "Enter City Name",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          search = true;
                        });
                      },
                      icon: const Icon(Icons.search)
                  )
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              Container(
                  child: search? weatherProvider.returnSearch(_search.text) : Container()
              )
            ],
          ),
        ),
      ),
    );
  }
}
