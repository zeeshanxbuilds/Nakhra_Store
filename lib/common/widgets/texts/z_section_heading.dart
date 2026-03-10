import 'package:flutter/material.dart';
import 'package:nakhra/utils/constants/colors.dart';
import 'package:nakhra/utils/constants/text_strings.dart';

class ZHomeScreenSectionHeading extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const ZHomeScreenSectionHeading({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        TextButton(
          style: TextButton.styleFrom(
            // padding: EdgeInsets.only(top: 1, bottom: 1, right: 4, left: 4),
          ),
          onPressed: onPressed,
          child: Text(
            ZTexts.seeAll,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ZColors.primary500),
          ),
        ),
      ],
    );
  }
}
