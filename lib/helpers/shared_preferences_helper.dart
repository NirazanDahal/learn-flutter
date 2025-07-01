import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {

static const String stringListKey="stringListKey";

static late SharedPreferences _preferences;

static Future<void> initialize()async{
  _preferences=await SharedPreferences.getInstance();
}

static Future<void> setStringList(String key, List<String> stringList)async{
  await _preferences.setStringList(key, stringList);
}

static List<String> getStringList(String key){
  return _preferences.getStringList(key)??[];
}

}