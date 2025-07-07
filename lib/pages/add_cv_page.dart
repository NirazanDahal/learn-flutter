import 'package:datepicker_cupertino/datepicker_cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_flutter/helpers/shared_preferences_helper.dart';
import 'package:learn_flutter/models/cv_model.dart';
import 'package:learn_flutter/pages/cv_page_widget.dart';
import 'package:learn_flutter/providers/cv_provider.dart';
import 'package:provider/provider.dart';

class AddCVPage extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  List<CVModel> cvList = [];

  String imageString = '';

  ImagePicker _imagePicker = ImagePicker();

  AddCVPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cvProvider = context.read<CvProvider>();
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

          ElevatedButton(
            onPressed: () {
              final _pickedImage = _imagePicker.pickImage(
                source: ImageSource.camera,
                // preferredCameraDevice: CameraDevice.front,
              );
            },
            child: Text("Pick Image"),
          ),

          // DatePickerCupertino(
          //   hintText: "DOB",
          //   onDateTimeChanged: (p0) {
          //     dateOfBirth = p0;
          //   },
          // ),
          ElevatedButton(
            onPressed: () {
              cvList.add(
                CVModel(
                  firstName: _firstNameController.text.trim(),
                  middleName: _middleNameController.text.trim(),
                  lastName: _lastNameController.text.trim(),
                  address: _addressController.text.trim(),
                  age: _ageController.text.trim(),
                  imageString: "",
                ),
              );
              cvProvider.saveCV(SharedPreferencesHelper.cvListKey, cvList);
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
