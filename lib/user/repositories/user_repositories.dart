// import 'dart:convert';
// import 'dart:developer';
// import 'package:http/http.dart' as http;
// import 'package:learn_flutter/user/constants/app_constants.dart';
// import 'package:learn_flutter/user/models/user_model.dart';

// class UserAPIRepositories {
//   static Future<List<UserAPIModel>> loadData() async {
//     try {
//       log("entered in function");
//       final response = await http.get(
//         Uri.parse(AppConstants.url),
//         headers: {
//           'User-Agent':
//               'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
//           'Accept': 'application/json',
//         },
//       );
//       log(response.statusCode.toString());
//       log(response.body);
//       if (response.statusCode == 200) {
//         final List<dynamic> jsonList = jsonDecode(response.body);
//         final userList = jsonList
//             .map((json) => UserAPIModel.fromJson(json))
//             .toList();
//         return userList;
//       } else {
//         log("error");
//         return [];
//       }
//     } catch (e) {
//       log(e.toString());
//       return [];
//     }
//   }
// }
