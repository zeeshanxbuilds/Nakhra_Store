import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:nakhra/features/authentication/screens/login/login.dart';
import 'package:nakhra/utils/constants/colors.dart';

class ZClickableRichText extends StatelessWidget {
  const ZClickableRichText({super.key, required this.firstTextPart, required this.secondTextPart});
  final String firstTextPart;
  final String secondTextPart;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "$firstTextPart ",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ZColors.darkGrey),
          ),
          TextSpan(
            text: secondTextPart,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(color: ZColors.primary500, fontWeight: FontWeight.w600),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.offAll(() => LoginScreen());
              },
          ),
        ],
      ),
    );
  }
}
