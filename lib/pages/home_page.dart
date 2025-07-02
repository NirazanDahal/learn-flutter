import 'package:flutter/material.dart';
import 'package:learn_flutter/helpers/shared_preferences_helper.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _todoController = TextEditingController();
  List<String> todoList = [];

  @override
  void initState() {
    todoList = SharedPreferencesHelper.getStringList(
      SharedPreferencesHelper.stringListKey,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo Home Page")),
      body: Column(
        children: [
          TextFormField(controller: _todoController),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              setState(() {
                todoList.add(_todoController.text.trim());
                SharedPreferencesHelper.setStringList(
                  SharedPreferencesHelper.stringListKey,
                  todoList,
                );
                _todoController.clear();
              });
            },
            child: Text("Click to add todo"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return todoList.isEmpty
                    ? Center(child: Text("No todo's yet"))
                    : Row(
                        children: [
                          Text(todoList[index]),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                todoList.removeAt(index);
                                SharedPreferencesHelper.setStringList(
                                  SharedPreferencesHelper.stringListKey,
                                  todoList,
                                );
                              });
                            },
                            icon: Icon(Icons.delete, color: Colors.red),
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
