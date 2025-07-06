import 'dart:developer';

import 'package:date_picker_textfield/date_picker_textfield.dart';
import 'package:datepicker_cupertino/datepicker_cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/helpers/shared_preferences_helper.dart';
import 'package:learn_flutter/models/cv_model.dart';
import 'package:learn_flutter/pages/cv_page.dart';

class AddCVPage extends StatefulWidget {
  const AddCVPage({super.key});

  @override
  State<AddCVPage> createState() => _AddCVPageState();
}

class _AddCVPageState extends State<AddCVPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  bool isMarried = false;
  DateTime dateOfBirth = DateTime.now();
  List<CVModel> cvList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create CV"), backgroundColor: Colors.green),
      body: Column(
        children: [
          SizedBox(height: 20),
          TextFormField(
            controller: _firstNameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "First Name",
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _middleNameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Middle Name",
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _lastNameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Last Name",
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _addressController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Address",
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _ageController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Age",
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Checkbox(
                value: isMarried,
                onChanged: (value) {
                  setState(() {
                    isMarried = value ?? false;
                  });
                  log(isMarried.toString());
                },
              ),

              Text("Married"),
            ],
          ),
          DatePickerCupertino(
            hintText: "DOB",
            onDateTimeChanged: (p0) {
              setState(() {
                dateOfBirth = p0;
              });
            },
          ),

          ElevatedButton(
            onPressed: () {
              setState(() {
                cvList.add(
                  CVModel(
                    firstName: _firstNameController.text.trim(),
                    middleName: _middleNameController.text.trim(),
                    lastName: _lastNameController.text.trim(),
                    address: _addressController.text.trim(),
                    age: _ageController.text.trim(),
                    dateofBirth: dateOfBirth.toString(),
                    isMarried: isMarried,
                  ),
                );
                SharedPreferencesHelper.saveCV(
                  SharedPreferencesHelper.cvListKey,
                  cvList,
                );
              });
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CVPage()),
              );
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
