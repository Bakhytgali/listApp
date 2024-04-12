import "package:flutter/material.dart";
import "package:todolist/utilities/my_button.dart";

class DialogBox extends StatelessWidget {
  final dynamic controller;
  final dynamic groupController;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.onSave,
    required this.onCancel,
    required this.controller,
    required this.groupController
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xff31363f),
      content: SizedBox(
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextField(
                  controller: controller, // Change this line
                  decoration: const InputDecoration(
                    labelText: "Enter the name",
                    labelStyle: TextStyle(
                      color: Color(0xFFEEEEEE),
                      fontSize: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF76ABAE)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF76ABAE)),
                    ),
                  ),
                  style: const TextStyle(
                    color: Color(0xFFEEEEEE),
                    fontSize: 14,
                  ),
                  cursorColor: const Color(0xFFEEEEEE),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: TextField(
                    controller: groupController, // Change this line
                    decoration: const InputDecoration(
                      labelText: "Enter the group",
                      labelStyle: TextStyle(
                        color: Color(0xFFEEEEEE),
                        fontSize: 14,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF76ABAE)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF76ABAE)),
                      ),
                    ),
                    style: const TextStyle(
                      color: Color(0xFFEEEEEE),
                      fontSize: 14,
                    ),
                    cursorColor: const Color(0xFFEEEEEE),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(text: "Save", onPressed: onSave),
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}

