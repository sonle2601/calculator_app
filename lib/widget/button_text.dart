import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final Function(String) onclick;

  const ButtonText({
    super.key,
    required this.text,
    required this.onclick,
    this.color = Colors.black,
    this.size = 20,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(24.0),
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.black26),
          ),
        ),
        onPressed: () => onclick(text),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: size,
                color: color
            ),
          ),
        ),
      ),
    );
  }
}