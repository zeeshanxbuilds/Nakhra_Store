// ignore_for_file: prefer_typing_uninitialized_variables, strict_top_level_inference

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nakhra/utils/constants/image_strings.dart';

class HomeAppbar extends StatelessWidget {
  final String title;
  final leading;
  final action;
  const HomeAppbar({super.key, required this.title, required this.leading, required this.action});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(onPressed: leading, icon: leading == null ? SizedBox() : SvgPicture.asset(ZImages.searchIcon)),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 23, fontWeight: FontWeight.w600),
        ),
        IconButton(onPressed: action, icon: action == null ? SizedBox() : SvgPicture.asset(ZImages.bellIcon)),
      ],
    );
  }
}
