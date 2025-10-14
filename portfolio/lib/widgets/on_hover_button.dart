import 'package:flutter/material.dart';

class OnHoverButton extends StatefulWidget {
  final Widget child;

  const OnHoverButton({super.key, required this.child});

  @override
  State<OnHoverButton> createState() => _OnHoverButtonState();
}

class _OnHoverButtonState extends State<OnHoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoverTransform = Matrix4.identity()..scale(1.2);
    // final hoverTransform = Matrix4.identity()..translate(0, -8, -0);
    final transformed = _isHovered ? hoverTransform : Matrix4.identity();

    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        color: _isHovered
            ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
            : Colors.transparent,
        duration: Duration(milliseconds: 200),
        transform: transformed,
        child: widget.child,
      ),
    );
  }

  void onEntered(bool isHovered) => setState(() {
    _isHovered = isHovered;
  });
}
