import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nakhra/utils/constants/image_strings.dart';
import 'package:nakhra/utils/constants/text_strings.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(onPressed: () {}, icon: SvgPicture.asset(ZImages.searchIcon)),
        Text(
          ZTexts.zHome,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 23, fontWeight: FontWeight.w600),
        ),
        IconButton(onPressed: () {}, icon: SvgPicture.asset(ZImages.bellIcon)),
      ],
    );
  }
}
