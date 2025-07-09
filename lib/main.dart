import 'package:flutter/material.dart';
import 'package:learn_flutter/helpers/shared_preferences_helper.dart';
import 'package:learn_flutter/pages/add_cv_page.dart';
import 'package:learn_flutter/pages/display_cv_page.dart';
import 'package:learn_flutter/providers/cv_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CvProvider(),
      child: MaterialApp(home: AddCVPage()),
    );
  }
}
