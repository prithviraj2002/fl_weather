class CityWeatherData{
  final dynamic temp;
  final dynamic feels_like;
  final dynamic maxTemp;
  final dynamic minTemp;
  final dynamic pressure;
  final dynamic humidity;
  final dynamic name;

  CityWeatherData({
    required this.temp,
    required this.feels_like,
    required this.minTemp,
    required this.maxTemp,
    required this.pressure,
    required this.humidity,
    required this.name
  });
  
  factory CityWeatherData.fromJson(Map<String, dynamic> json){
    return CityWeatherData(
        temp: json['temp'],
        feels_like: json['feels_like'],
        minTemp: json['temp_min'],
        maxTemp: json['temp_max'],
        pressure: json['pressure'],
        humidity: json['humidity'],
      name: json['name']
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'temp' : temp,
      'feels_like' : feels_like,
      'minTemp' : minTemp,
      'maxTemp' : maxTemp,
      'pressure' : pressure,
      'humidity' : humidity,
      'name' : name
    };
  }
}