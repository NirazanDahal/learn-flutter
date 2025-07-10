import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_flutter/cv/models/cv_model.dart';
import 'package:learn_flutter/cv/pages/display_cv_page.dart';
import 'package:learn_flutter/cv/providers/cv_provider.dart';
import 'package:provider/provider.dart';

class AddCVPage extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  ImagePicker _imagePicker = ImagePicker();

  AddCVPage({super.key});

  void _clearCVs(BuildContext context) {
    context.read<CvProvider>().clearAllCVs();
  }

  bool _addCV(BuildContext context, String imageString) {
    try {
      final cv = CvModel(
        firstName: _firstNameController.text.trim(),
        middleName: _middleNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        address: _addressController.text.trim(),
        age: _ageController.text.trim(),
        imageString: imageString,
      );

      context.read<CvProvider>().saveCVs(cv);
      _firstNameController.clear();
      _middleNameController.clear();
      _lastNameController.clear();
      _addressController.clear();
      _ageController.clear();

      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final imageFile = await _imagePicker.pickImage(source: source);
    if (imageFile == null) return;
    final imageBytes = await imageFile.readAsBytes();
    final imageString = base64Encode(imageBytes);
    // log(imageString);
    context.read<CvProvider>().pickImage(imageString);
  }

  @override
  Widget build(BuildContext context) {
    final cvProvider = context.watch<CvProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Add CV Page"),
        actions: [
          IconButton(
            onPressed: () {
              _clearCVs(context);
            },
            icon: Icon(Icons.clear),
          ),
        ],
      ),
      body: Column(
        children: [
          TextFormField(controller: _firstNameController),
          TextFormField(controller: _middleNameController),

          TextFormField(controller: _lastNameController),

          TextFormField(controller: _addressController),

          TextFormField(controller: _ageController),
          Row(
            children: [
              ElevatedButton(
                onPressed: () async {
                  await _pickImage(context, ImageSource.camera);
                },
                child: Icon(Icons.camera),
              ),
              ElevatedButton(
                onPressed: () async {
                  await _pickImage(context, ImageSource.gallery);
                },
                child: Icon(Icons.browse_gallery),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              final success = _addCV(context, cvProvider.imageString);
              if (success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Cv added successfully")),
                );
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => DisplayCVPage()),
                );
                log("Cv was added successfully");
              } else {
                log("Error adding cv");
                return;
              }
            },
            child: Text("Add CV"),
          ),
        ],
      ),
    );
  }
}
