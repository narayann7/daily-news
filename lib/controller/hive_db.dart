import 'package:hive_flutter/hive_flutter.dart';

class AppHiveDb {
  static String dbName = "myHivedb";

  static Future<dynamic> setData(dynamic data) async {
    try {
      Box box = await Hive.openBox(dbName);

      box.add(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<dynamic> getAllData() async {
    try {
      Box box = await Hive.openBox(dbName);
      return box.toMap();
    } catch (e) {
      return false;
    }
  }

  static Future<dynamic> clearData(int index) async {
    try {
      Box box = await Hive.openBox(dbName);
      box.clear();

      return true;
    } catch (e) {
      return false;
    }
  }
}
