import 'package:flutter/material.dart';

class ZElevatedButton extends StatelessWidget {
  const ZElevatedButton({super.key, required this.child, required this.onPressed});
  final Widget child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(style: ElevatedButton.styleFrom(), onPressed: onPressed, child: child);
  }
}
