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

  // List of tasks :
  List toDoList = [
    ["Fuck Merey", true],
    ["Find the internship", false]
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // Create a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        }
    );
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([ _controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void onDelete() {
    // toDoList.remove()
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
                taskCompleted: toDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
            );
          },
        )
    );
  }
}