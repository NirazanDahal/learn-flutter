import 'package:learn_flutter/models/cv_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String cvListKey = "todoKey";
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveCV(String key, List<CVModel> todos) async {
    List<String> jsonList = todos.map((todo) => todo.toJson()).toList();
    await _preferences.setStringList(key, jsonList);
  }

  static List<CVModel> loadCV(String key) {
    List<String> jsonList = _preferences.getStringList(key) ?? [];
    return jsonList.map((json) => CVModel.fromJson(json)).toList();
  }
}
