import 'package:flutter/material.dart';

class TypingField extends StatelessWidget {
  final TextEditingController controller;
  final Function onPressed;

  TypingField({
    this.controller,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(Icons.send),
          onPressed: this.onPressed,
        ),
      ),
    );
  }
}
