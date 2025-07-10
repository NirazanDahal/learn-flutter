import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:learn_flutter/user/constants/app_constants.dart';
import 'package:learn_flutter/user/models/user_model.dart';

class UserRepositories {
  static Future<List<UserModel>> loadData() async {
    try {
      final response = await http.get(Uri.parse(AppConstants.url));
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final userList = jsonList
            .map((json) => UserModel.fromJson(json))
            .toList();
        return userList;
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
