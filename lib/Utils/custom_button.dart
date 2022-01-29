import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final double height;
  final Gradient gradient;
  final Widget child;
  final VoidCallback? onClick;

  const MyElevatedButton({
    required this.onClick,
    required this.child,
    this.height = 44.0,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          // shadowColor: Colors.red,
          elevation: 25,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: child,
      ),
    );
  }
}
