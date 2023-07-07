class City{
  final String name;
  final double lat;
  final double lon;

  City({
    required this.name,
    required this.lat,
    required this.lon
  });

  factory City.fromJson(Map<String, dynamic> json){
    return City(
      name: json['name'],
      lat: json['lat'],
      lon: json['lon']
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'lat' : lat,
      'lon' : lon
    };
  }
}