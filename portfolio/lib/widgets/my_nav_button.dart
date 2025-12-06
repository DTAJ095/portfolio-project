import 'package:flutter/material.dart';

class MyNavButton extends StatefulWidget {
  const MyNavButton({super.key, required this.child, required this.onPressed});

  final Widget child;
  final VoidCallback onPressed;

  @override
  State<MyNavButton> createState() => _MyNavButtonState();
}

class _MyNavButtonState extends State<MyNavButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextButton(
        onPressed: widget.onPressed,
        onHover: (hovering) {
          setState(() {
            isPressed = hovering;
          });
        },
        style: TextButton.styleFrom(
          backgroundColor: isPressed ? Colors.blue : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: widget.child,
      ),
    );
  }
}
