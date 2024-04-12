import "package:flutter/material.dart";

//ignore: must_be_immutable
class ToDoTile extends StatelessWidget {

  final String taskName;
  final String groupName;
  final int index;
  final bool taskCompleted;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  Function(bool?)? onChanged;

  ToDoTile({super.key,
    required this.taskName,
    required this.groupName,
    required this.index,
    required this.taskCompleted,
    required this.onChanged,
    required this.onDelete,
    required this.onEdit
  });

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Checkbox
              Row(
                children: [
                  Checkbox(value: taskCompleted, onChanged: onChanged),
                  //task name
                  Text(
                      "ID: $index \n$taskName \n$groupName",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Arial",
                          color: const Color(0xff222831),
                          decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none
                      )
                  )
                ],
              ),
              Row (
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: onEdit, // Call onEdit callback function
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: onDelete, // Call onDelete callback function
                  )
                ]
              )
            ],
          )
      ),
    );
  }
}