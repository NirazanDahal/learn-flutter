import 'dart:convert';

class CvModel {
  final String firstName;
  final String middleName;
  final String lastName;
  final String address;
  final String age;
  final String imageString;

  CvModel({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.address,
    required this.age,
    required this.imageString,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'address': address,
      'age': age,
      'imageString': imageString,
    };
  }

  factory CvModel.fromMap(Map<String, dynamic> map) {
    return CvModel(
      firstName: map['firstName'],
      middleName: map['middleName'],
      lastName: map['lastName'],
      address: map['address'],
      age: map['age'],
      imageString: map['imageString'],
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory CvModel.fromJson(String json) {
    return CvModel.fromMap(jsonDecode(json));
  }
}
