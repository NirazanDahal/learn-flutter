import 'package:learn_flutter/models/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String stringListKey = "todoKey";
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveTodo(String key, List<TodoModel> todos) async {
    List<String> jsonList = todos.map((todo) => todo.toJson()).toList();
    await _preferences.setStringList(key, jsonList);
  }

  static List<TodoModel> loadTodo(String key) {
    List<String> jsonList = _preferences.getStringList(key) ?? [];
    return jsonList.map((json) => TodoModel.fromJson(json)).toList();
  }
}
