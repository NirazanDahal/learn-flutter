import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:learn_flutter/user/constants/app_constants.dart';
import 'package:learn_flutter/user/models/user_model.dart';
import 'package:learn_flutter/userFromApi/constants/app_API_constants.dart';
import 'package:learn_flutter/userFromApi/models/user_API_model.dart';

class UserAPIRepository {
  static Future<void> loginUser(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(AppConstants.baseUrl + AppConstants.loginEndpoint),
        // headers: {"Content-Type": "application/json"},
        body: {"email": email, "password": password},
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        log(jsonData['message']);
        log(jsonData['token']);
        // log(jsonData.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<UserAPIModel> fetchUserData() async {
    try {
      final response = await http.get(
        Uri.parse(AppConstants.baseUrl + AppConstants.uerFetchEndpoint),
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNjg2ZTdjOWU2MDUwNjJjMjY0NWZmYzIzIn0sImlhdCI6MTc1MjA3MTcyOCwiZXhwIjoxNzUyNTAzNzI4fQ.G_WLyfkVBI0Y-uRvhiTRy99H5PUg1MBxbm3sc7ZBS0Q",
        },
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonList = jsonDecode(response.body);
        final usermodel = UserAPIModel.fromJson(jsonList);
        return usermodel;
      } else {
        throw Exception("Failed to load user data: ${response.statusCode}");
      }
    } catch (e) {
      log("Error fetching user data: $e");
      rethrow;
    }
  }
}
