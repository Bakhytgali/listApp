import "package:flutter/material.dart";


class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;

  Function(bool?)? onChanged;

  ToDoTile({super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, right: 24.0, left: 24.0),
      child: Container(
          padding: const EdgeInsets.all(14.0),
          decoration: BoxDecoration(
            color: const Color(0xFFEEEEEE),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            children: [
              //Checkbox
              Checkbox(value: taskCompleted, onChanged: onChanged),
              //task name
              Text(
                  taskName,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Arial",
                      color: const Color(0xff222831),
                      decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none
                  )
              ),
            ],
          )
      ),
    );
  }
}