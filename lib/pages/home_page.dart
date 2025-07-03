import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learn_flutter/helpers/shared_preferences_helper.dart';
import 'package:learn_flutter/models/todo_model.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();

  List<TodoModel> todoList = [];

  removeTodoAtIndex(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  void initState() {
    todoList = SharedPreferencesHelper.loadTodo(
      SharedPreferencesHelper.stringListKey,
    );
    log(todoList.length.toString());
    super.initState();
  }

  add() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo Home Page")),
      body: Column(
        children: [
          SizedBox(height: 20),
          TextFormField(
            controller: _titleController,
            decoration: InputDecoration(hintText: "Todo Title"),
          ),
          SizedBox(height: 5),
          TextFormField(
            controller: _subtitleController,
            decoration: InputDecoration(hintText: "Todo Subtitle"),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              setState(() {
                todoList.add(
                  TodoModel(
                    firstName: _titleController.text.trim(),
                    middleName: _subtitleController.text.trim(),
                  ),
                );
                SharedPreferencesHelper.saveTodo(
                  SharedPreferencesHelper.stringListKey,
                  todoList,
                );

                _titleController.clear();
                _subtitleController.clear();
              });
            },
            child: Text("Click to add todo"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                final todo = todoList[index];
                return todoList.isEmpty
                    ? Center(child: Text("No todo's yet"))
                    : Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  todo.firstName,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  todo.middleName,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                removeTodoAtIndex(index);
                              },
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
