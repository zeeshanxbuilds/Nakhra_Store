import 'package:flutter/material.dart';
import 'package:nakhra/utils/constants/colors.dart';
import 'package:nakhra/utils/constants/text_strings.dart';

class ZUserProfileHeader extends StatelessWidget {
  final String userProfileImage;
  final String userProfileName;
  final String userProfileemail;
  final VoidCallback trailingOnTap;
  const ZUserProfileHeader({
    super.key,
    required this.userProfileImage,
    required this.userProfileName,
    required this.userProfileemail,
    required this.trailingOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(userProfileImage),
        backgroundColor: ZColors.primary400,
      ),
      title: Text(userProfileName, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ZColors.black)),
      subtitle: Text(
        userProfileemail,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(color: ZColors.darkGrey),
      ),
      // trailing: Text("Logout"),
      trailing: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.all(0), overlayColor: Colors.transparent),
        onPressed: trailingOnTap,
        child: Text(
          ZTexts.zLogout,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ZColors.red, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
