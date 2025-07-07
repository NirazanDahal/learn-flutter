import 'package:flutter/material.dart';
import 'package:learn_flutter/helpers/shared_preferences_helper.dart';
import 'package:learn_flutter/models/cv_model.dart';

class CvProvider extends ChangeNotifier {
  void saveCV(String cvListKey, List<CVModel> cvModelList) {
    SharedPreferencesHelper.saveCV(cvListKey, cvModelList);
    notifyListeners();
  }

  void loadCV(String cvListKey) {
    SharedPreferencesHelper.loadCV(cvListKey);
    notifyListeners();
  }
}
