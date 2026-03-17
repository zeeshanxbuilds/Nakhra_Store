import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nakhra/utils/constants/colors.dart';
import 'package:nakhra/utils/constants/image_strings.dart';

class ZProfileMenuTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final Widget? trailing;
  final VoidCallback? ontap;
  const ZProfileMenuTile({super.key, required this.leading, required this.title, this.trailing, this.ontap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(shape: BoxShape.circle, color: ZColors.primary500.withValues(alpha: 0.08)),
        child: leading,
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text(title, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ZColors.black)),
      ),
      trailing: SvgPicture.asset(
        ZImages.cheveronTrailingIcon,
        height: 24,
        width: 24,
        colorFilter: ColorFilter.mode(ZColors.gray500, BlendMode.srcIn),
      ),
      onTap: ontap,
      // onTap: ontap,
    );
  }
}
