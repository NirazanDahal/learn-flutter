import 'dart:convert';

class CVModel {
  final String firstName;
  final String middleName;
  final String lastName;
  final String address;
  final String age;
  final String dateofBirth;
  final bool isMarried;

  CVModel({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.address,
    required this.age,
    required this.dateofBirth,
    required this.isMarried,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'address': address,
      'age': age,
      'dateofBirth': dateofBirth,
      'isMarried': isMarried,
    };
  }

  factory CVModel.fromMap(Map<String, dynamic> map) {
    return CVModel(
      firstName: map['firstName'],
      middleName: map['middleName'],
      lastName: map['lastName'],
      address: map['address'],
      age: map['age'],
      dateofBirth: map['dateofBirth'],
      isMarried: map['isMarried'],
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory CVModel.fromJson(String json) {
    return CVModel.fromMap(jsonDecode(json));
  }
}
