import 'package:flutter/cupertino.dart';
import 'package:learn_flutter/user/models/user_model.dart';
import 'package:learn_flutter/user/repositories/user_repositories.dart';
import 'package:learn_flutter/userFromApi/models/user_API_model.dart';
import 'package:learn_flutter/userFromApi/repositories/user_API_repository.dart';

class UserAPIProvider extends ChangeNotifier {
  UserAPIModel _cvList = UserAPIModel();
  UserAPIModel get cvList => _cvList;

  UserAPIProvider() {
    loadData();
  }

  void loadData() async {
    _cvList = await UserAPIRepository.fetchUserData();
    notifyListeners();
  }

  void userLogin(String email, String password) async {
    await UserAPIRepository.loginUser(email, password);
  }
}
