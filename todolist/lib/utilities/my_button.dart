import "package:flutter/material.dart";

class MyButton extends StatefulWidget {
  final String text;
  VoidCallback onPressed;

  MyButton ({
    super.key,
    required this.text,
    required this.onPressed
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: widget.onPressed,
        color: const Color(0xFF76ABAE),
        child: Text(widget.text)
    );
  }
}
