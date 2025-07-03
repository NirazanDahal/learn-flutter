import 'dart:convert';

class TodoModel {
  final String firstName;
  final String middleName;
  final String? lastName;
  final String? address;
  final int? age;
  final DateTime? dateofBirth;
  final bool? isMarried;

  TodoModel({
    required this.firstName,
    required this.middleName,
    this.lastName,
    this.address,
    this.age,
    this.dateofBirth,
    this.isMarried,
  });

  Map<String, dynamic> toMap() {
    return {'firstName': firstName, 'middleName': middleName};
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(title: map['title'], subtitle: map['subtitle']);
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory TodoModel.fromJson(String json) {
    return TodoModel.fromMap(jsonDecode(json));
  }
}
