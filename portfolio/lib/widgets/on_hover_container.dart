// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class OnHoverContainer extends StatefulWidget {
  final Widget child;

  const OnHoverContainer({super.key, required this.child});

  @override
  State<OnHoverContainer> createState() => _OnHoverContainerState();
}

class _OnHoverContainerState extends State<OnHoverContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoverTransformed = Matrix4.identity()..scale(1.02);
    final transformed = _isHovered ? hoverTransformed : Matrix4.identity();

    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        height: 1500,
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          gradient: _isHovered
              ? LinearGradient(
                  colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 94, 96, 175),
                    const Color.fromARGB(255, 13, 32, 119),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        transform: transformed,
        child: widget.child,
      ),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
