import 'package:flutter/material.dart';

class ButtonImage extends StatelessWidget {
  final String image;
  final Function(String) onclick;
  final Color backgroundColor;

  const ButtonImage({
    Key? key,
    required this.image,
    required this.onclick,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(24.0),
          backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.black26),
          ),
        ),
        onPressed: () => onclick(image),
        child: Center(
          child: SizedBox(
              height: 23,
              child: Image.asset("assets/images/$image.png")
          ),
        ),
      ),
    );
  }
}