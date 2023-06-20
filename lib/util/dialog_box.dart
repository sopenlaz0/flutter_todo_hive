import "package:flutter/material.dart";

class DialogBox extends StatelessWidget {
  final taskNameController;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.taskNameController,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Todo Task'),
      content: Container(
        // height: 120,
        child: TextField(
          controller: taskNameController,
          decoration: InputDecoration(
            hintText: 'Enter task name',
          ),
        ),
      ),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            // Navigator.of(context).pop();
            onCancel();
          },
        ),
        TextButton(
            child: Text('Add'),
            onPressed: () {
              onSave();
              // Navigator.of(context).pop();
            }),
      ],
    );
  }
}
