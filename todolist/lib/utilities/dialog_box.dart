import "package:flutter/material.dart";
import "package:todolist/utilities/my_button.dart";

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.onSave,
    required this.onCancel,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xff31363f),
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
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

