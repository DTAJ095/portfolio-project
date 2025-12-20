import 'package:flutter/material.dart';

class CircleLoader extends StatefulWidget {
  const CircleLoader({super.key, required this.child});
  final Widget child;

  @override
  State<CircleLoader> createState() => _CircleLoaderState();
}

class _CircleLoaderState extends State<CircleLoader> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
