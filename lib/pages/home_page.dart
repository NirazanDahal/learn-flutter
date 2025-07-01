import 'package:flutter/material.dart';
import 'package:learn_flutter/helpers/shared_preferences_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _todoController = TextEditingController();
  List<String> _todoList = [];

  @override
  void initState() {
    _todoList = SharedPreferencesHelper.getStringList(
      SharedPreferencesHelper.stringListKey,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo Homepage")),
      body: Column(
        children: [
          TextFormField(controller: _todoController),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _todoList.add(_todoController.text.trim());
                SharedPreferencesHelper.setStringList(
                  SharedPreferencesHelper.stringListKey,
                  _todoList,
                );
                _todoController.clear();
              });
            },
            child: Text("Add"),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: _todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_todoList[index] ?? "No Todos Yet"),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        _todoList.removeAt(index);
                        SharedPreferencesHelper.setStringList(
                          SharedPreferencesHelper.stringListKey,
                          _todoList,
                        );
                      });
                    },

                    icon: Icon(Icons.delete, color: Colors.red),
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
