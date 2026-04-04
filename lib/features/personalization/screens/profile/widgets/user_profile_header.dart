import 'package:flutter/material.dart';
import 'package:nakhra/utils/constants/colors.dart';
import 'package:nakhra/utils/constants/image_strings.dart';
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
    final bool isNetworkImage = userProfileImage.isNotEmpty;
    final imageProvider = isNetworkImage
        ? NetworkImage(userProfileImage) as ImageProvider
        : AssetImage(ZImages.profileImage);

    return ListTile(
      leading: CircleAvatar(radius: 30, backgroundImage: imageProvider, backgroundColor: ZColors.primary400),
      title: Text(
        userProfileName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ZColors.black, fontSize: 17),
      ),
      subtitle: Text(
        userProfileemail,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(color: ZColors.gray500),
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
