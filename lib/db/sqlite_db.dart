import 'package:fl_weather/model/city_data/city_data.dart';
import 'package:flutter/material.dart';

import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';
import 'package:async/async.dart';

class DB{
  static Future<Database> getDb() async{
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
      path.join(await getDatabasesPath(), 'cities.db'),
      onCreate: (db, version){
        db.execute('CREATE TABLE cities(lat INTEGER PRIMARY KEY, lon INTEGER ,city TEXT)');
      },
      version: 1
    );
    return database;
  }

  static Future<void> addCity(City c) async{
    final db = await getDb();
    db.insert(
        'cities',
        c.toMap()
    );
  }

  static Future<void> removeCity(City c) async{
    final db = await getDb();
    db.delete(
      'cities',
      where: 'id = ?',
      whereArgs: [c.lat]
    );
  }

  static Future<List<City>> getCities() async{
    final db = await getDb();
    List<Map<String, dynamic>> data = await db.query('cities');

    return List.generate(data.length, (index) => City.fromJson(data[index]));
  }
}