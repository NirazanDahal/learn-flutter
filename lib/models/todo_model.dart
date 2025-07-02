import 'dart:convert';

class TodoModel {
  final String title;
  final String subtitle;

  TodoModel({required this.title, required this.subtitle});

  Map<String, dynamic> toMap() {
    return {'title': title, 'subtitle': subtitle};
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
