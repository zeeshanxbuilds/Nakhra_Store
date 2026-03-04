import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:nakhra/common/styles/spacing_styles.dart';
import 'package:nakhra/common/widgets/login_signup/clickable_rich_text.dart';
import 'package:nakhra/common/widgets/login_signup/z_elevated_button.dart';
import 'package:nakhra/common/widgets/login_signup/z_text_field.dart';
import 'package:nakhra/features/authentication/screens/login/login.dart';
import 'package:nakhra/features/authentication/screens/terms_and_policy/terms_and_datapolicy_screen.dart';
import 'package:nakhra/home_menu_getx.dart';
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
        // backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Get.to(() => LoginScreen()),
          icon: SvgPicture.asset(ZImages.backArrow),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: ZSpacingStyle.leftRightPadding,
            sliver: SliverToBoxAdapter(
              child: Column(
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
                            TextSpan(
                              text: ZTexts.todayWord,
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: ZColors.primary600,
                                fontWeight: FontWeight.w600,
                              ),
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
                        ZTextFormField(label: ZTexts.zName, hintText: ZTexts.zNameHintText),
                        const SizedBox(height: ZSizes.md),
                        ZTextFormField(label: ZTexts.email, hintText: ZTexts.zYourEmail),
                        const SizedBox(height: ZSizes.md),
                        ZTextFormField(
                          label: ZTexts.password,
                          hintText: ZTexts.zYourPassword,
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              ZImages.outlinedEyeIcon,
                              height: 24,
                              width: 24,
                              colorFilter: ColorFilter.mode(ZColors.gray400, BlendMode.srcIn),
                            ),
                          ),
                        ),
                        const SizedBox(height: ZSizes.customSpaceBtwSections),
                        SizedBox(
                          width: double.infinity,
                          child: ZElevatedButton(
                            onPressed: () => Get.to(() => ZBottomNavigationBar()),
                            child: Text(ZTexts.zRegister),
                          ),
                        ),
                        const SizedBox(height: ZSizes.spaceBtwSections),
                        Align(
                          alignment: Alignment.center,
                          child: ZClickableRichText(
                            firstTextPart: ZTexts.zAlreadyHaveAnAccount,
                            secondTextPart: ZTexts.zSignin,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: ZSizes.xl),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "${ZTexts.zByClickingRegister}\n",
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 12.5),
                      ),
                      TextSpan(
                        text: ZTexts.zTermAndDataPolicy,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: ZColors.primary500,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(() => TermsAndDatapolicyScreen());
                          },
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
