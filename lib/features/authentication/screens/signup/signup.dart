import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nakhra/common/styles/spacing_styles.dart';
import 'package:nakhra/utils/constants/colors.dart';
import 'package:nakhra/utils/constants/image_strings.dart';
import 'package:nakhra/utils/constants/sizes.dart';
import 'package:nakhra/utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: SvgPicture.asset(ZImages.backArrow)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: ZSpacingStyle.paddingWithoutAppBarHeight,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ZSignUpPage Header
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: ZSizes.sm),
                  Text(ZTexts.zSignup, style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: ZSizes.md),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${ZTexts.signupScreenSubTitle} ",
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ZColors.darkGrey),
                        ),
                        // SizedBox(width: ,)
                        TextSpan(
                          text: ZTexts.todayWord,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge!.copyWith(color: ZColors.primary600, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: ZSizes.md),

              // ZSingUpPageForm
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ZTexts.zName, style: Theme.of(context).textTheme.bodyLarge!.copyWith()),
                    const SizedBox(height: ZSizes.xs),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ZColors.grey10,
                        hintText: ZTexts.zNameHintText,
                        hintStyle: Theme,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
