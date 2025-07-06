import 'package:flutter/material.dart';
import 'package:learn_flutter/helpers/shared_preferences_helper.dart';
import 'package:learn_flutter/pages/add_cv_page.dart';
import 'package:learn_flutter/pages/cv_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AddCVPage());
  }
}
