import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_flutter/models/cv_model.dart';
import 'package:learn_flutter/providers/cv_provider.dart';
import 'package:provider/provider.dart';

class AddCVPage extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  ImagePicker _imagePicker = ImagePicker();

  AddCVPage({super.key});

  void _addCV(BuildContext context, String imageString) {
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
  }

  Future<void> _pickImage(BuildContext context) async {
    final imageFile = await _imagePicker.pickImage(source: ImageSource.camera);
    final imageBytes = await File(imageFile.toString()).readAsBytes();
    final imageString = base64Encode(imageBytes);
    context.read<CvProvider>().pickImage(imageString);
  }

  @override
  Widget build(BuildContext context) {
    final cvProvider = context.watch<CvProvider>();
    return Scaffold(
      appBar: AppBar(title: Text("Add CV Page")),
      body: Column(
        children: [
          TextFormField(controller: _firstNameController),
          TextFormField(controller: _middleNameController),

          TextFormField(controller: _lastNameController),

          TextFormField(controller: _addressController),

          TextFormField(controller: _ageController),
          ElevatedButton(
            onPressed: () {
              _pickImage(context);
            },
            child: Text("Pick Image"),
          ),
          ElevatedButton(
            onPressed: () {
              _addCV(context, cvProvider.imageString);
            },
            child: Text("Add CV"),
          ),

          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return cvProvider.cvList.isEmpty
                    ? Center(child: Text("No CV's yet"))
                    : Column(
                        children: [
                          Text(cvProvider.cvList[index].firstName),
                          Text(cvProvider.cvList[index].middleName),
                          Text(cvProvider.cvList[index].lastName),
                          Text(cvProvider.cvList[index].address),
                          Text(cvProvider.cvList[index].age),
                          Image.memory(
                            base64Decode(cvProvider.cvList[index].imageString),
                          ),
                        ],
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
