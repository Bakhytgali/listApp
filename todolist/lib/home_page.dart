import "package:flutter/material.dart";
import "package:todolist/utilities/dialog_box.dart";
import "package:todolist/utilities/todo_tile.dart";

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final _groupController = TextEditingController();

  // List of tasks :
  List toDoList = [
    ["Finish Flutter Lisp App", "SE-2216", true],
    ["Get 100% Points", "11 A ",false]
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][2] = !toDoList[index][2];
    });
  }

  // Create a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            groupController: _groupController,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        }
    );
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([ _controller.text, _groupController.text, false]);
      _controller.clear();
      _groupController.clear();
    });
    Navigator.of(context).pop();
  }

  void onDelete(int index) {
    setState(() {
      toDoList.removeAt(index); // Remove the task at the specified index
    });
  }

  void onDeleteConfirmation(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Task'),
          content: const Text('Are you sure you want to delete this task?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onDelete(index); // Call onDelete if the user confirms
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void onEditTask(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          groupController: _groupController,
          onSave: () => saveEditedTask(index), // Define function to save edited task
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void saveEditedTask(int index) {
    setState(() {
      toDoList[index][0] = _controller.text; // Update task name with edited text
      _controller.clear();
      toDoList[index][1] = _groupController.text;
      _groupController.clear();
    });
    Navigator.of(context).pop(); // Close the dialog
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff31363f),
        appBar: AppBar(
          title: const Center(
            child: Text(
              "To Do List by RB",
              style: TextStyle(
                  color: Color(0xFF76ABAE),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                  fontSize:  14,
                  fontFamily: "Arial"
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: const Color(0xff222831),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          backgroundColor: const Color(0xFF76ABAE),
          child: const Icon(
            Icons.add,
          ),
        ),
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index){
            return ToDoTile(
                taskName: toDoList[index][0],
                groupName: toDoList[index][1],
                taskCompleted: toDoList[index][2],
                index: index + 1,
                onChanged: (value) => checkBoxChanged(value, index),
                onDelete: () => onDeleteConfirmation(index),
                onEdit: () => onEditTask(index),
            );
          },
        )
    );
  }
}