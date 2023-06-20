import 'package:flutter/material.dart';
import 'package:todo_hive/util/dialog_box.dart';
import 'package:todo_hive/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List toDoList = [
    ["Make Tutorial", false],
    ["Do Exercise", false],
  ];

  //create a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              taskNameController: _controller,
              onCancel: () {
                Navigator.of(context).pop();
              },
              onSave: () => setState(() {
                    toDoList.add([_controller.text, false]);
                    _controller.clear();
                    Navigator.of(context).pop();
                  }));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Todo"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'List of Tasks',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: toDoList.length,
              itemBuilder: (context, index) => ToDoTile(
                taskName: toDoList[index][0],
                taskCompleted: toDoList[index][1],
                onChanged: (bool? value) {
                  setState(() {
                    toDoList[index][1] = value!;
                  });
                },
                deleteFunction: (context) {
                  setState(() {
                    toDoList.removeAt(index);
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
