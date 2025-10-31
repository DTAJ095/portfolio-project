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
    final hoverTransformed = Matrix4.identity()..scale(1.05);
    final transformed = _isHovered ? hoverTransformed : Matrix4.identity();

    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: _isHovered
              ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
              : Colors.transparent,
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
