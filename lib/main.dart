import 'package:flutter/material.dart';
import 'package:learn_flutter/cv/pages/add_cv_page.dart';
import 'package:learn_flutter/cv/providers/cv_provider.dart';
import 'package:learn_flutter/user/provider/user_provider.dart';
import 'package:learn_flutter/user/screens/user_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SharedPreferencesHelper.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(home: UserScreen()),
    );
  }
}
