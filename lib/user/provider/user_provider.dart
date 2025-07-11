// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:learn_flutter/user/constants/app_constants.dart';
// import 'package:learn_flutter/user/models/user_model.dart';
// import 'package:learn_flutter/user/repositories/user_repositories.dart';

// class UserProvider extends ChangeNotifier {
//   List<UserAPIModel> _userList = [];
//   List<UserAPIModel> get userList => _userList;

//   UserProvider() {
//     fetchDataFromApi();
//   }

//   void fetchDataFromApi() async {
//     _userList = await UserAPIRepositories.loadData();
//     notifyListeners();
//   }
// }
