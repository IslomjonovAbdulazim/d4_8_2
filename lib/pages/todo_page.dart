import 'package:d4_8_2/models/todo_model.dart';
import 'package:d4_8_2/service/network_service.dart';
import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  bool isLoading = false;
  List<TodoModel> todos = [];

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    isLoading = true;
    setState(() {});
    todos = await NetworkService().getAllTodos();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos"),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator.adaptive())
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final model = todos[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    tileColor: Colors.indigo,
                    title: Text(model.title),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    subtitle: Text(
                        "ID: ${model.id}, User Id: ${model.userId}, Status: ${model.completed}"),
                  ),
                );
              },
            ),
    );
  }
}
