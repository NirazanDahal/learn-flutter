import 'package:flutter/material.dart';
import 'package:learn_flutter/helpers/shared_preferences_helper.dart';
import 'package:learn_flutter/models/cv_model.dart';

class CVPage extends StatefulWidget {
  const CVPage({super.key});

  @override
  State<CVPage> createState() => _CVPageState();
}

class _CVPageState extends State<CVPage> {
  List<CVModel> cvList = [];

  @override
  void initState() {
    cvList = SharedPreferencesHelper.loadCV(SharedPreferencesHelper.cvListKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CV Page"), backgroundColor: Colors.blueGrey),
      body: ListView.builder(
        itemCount: cvList.length,
        itemBuilder: (context, index) {
          final cv = cvList[index];
          return cvList.isEmpty
              ? Text("No CV available")
              : Column(
                  children: [
                    Text(cv.firstName),
                    Text(cv.middleName),
                    Text(cv.lastName),
                    Text(cv.age),
                    Text(cv.address),
                  ],
                );
        },
      ),
    );
  }
}
