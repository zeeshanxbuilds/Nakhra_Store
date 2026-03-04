import 'package:flutter/material.dart';
import 'package:nakhra/utils/constants/text_strings.dart';

class TermsAndDatapolicyScreen extends StatelessWidget {
  const TermsAndDatapolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("${ZTexts.zTermAndDataPolicy}\n         In Progress 🚗")],
        ),
      ),
    );
  }
}
