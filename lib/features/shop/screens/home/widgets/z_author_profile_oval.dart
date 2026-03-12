import 'package:flutter/material.dart';

class ZAuthorProfileOval extends StatelessWidget {
  final image;
  const ZAuthorProfileOval({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle),
      clipBehavior: Clip.hardEdge,
      child: Image.asset(image, fit: BoxFit.contain),
    );
  }
}
