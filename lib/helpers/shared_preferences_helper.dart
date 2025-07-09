import 'package:learn_flutter/models/cv_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String cvListKey = "cvListKey";
  static late SharedPreferences _preferences;
  static Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveCVs(List<CvModel> cvList) async {
    final jsonList = cvList.map((cv) => cv.toJson()).toList();
    await _preferences.setStringList(cvListKey, jsonList);
  }

  static List<CvModel> loadCVs() {
    final jsonList = _preferences.getStringList(cvListKey) ?? [];
    final cvModel = jsonList.map((json) => CvModel.fromJson(json)).toList();
    return cvModel;
  }

  static Future<void> clearAll() async {
    await _preferences.clear();
  }
}
