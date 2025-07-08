import 'package:flutter/material.dart';
import 'package:learn_flutter/helpers/shared_preferences_helper.dart';
import 'package:learn_flutter/models/cv_model.dart';

class CvProvider extends ChangeNotifier {
  List<CvModel> _cvList = [];
  String _imageString = "";
  List<CvModel> get cvList => _cvList;
  String get imageString => _imageString;

  CvProvider() {
    _loadCVs();
  }

  void pickImage(String imageString) {
    _imageString = imageString;
    notifyListeners();
  }

  void saveCVs(CvModel cv) {
    _cvList.add(cv);
    SharedPreferencesHelper.saveCVs(_cvList);
    notifyListeners();
  }

  void removeCV(int index) {
    _cvList.removeAt(index);
    SharedPreferencesHelper.saveCVs(_cvList);
    notifyListeners();
  }

  void _loadCVs() {
    _cvList = SharedPreferencesHelper.loadCVs();
  }
}
