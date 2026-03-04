import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nakhra/common/styles/spacing_styles.dart';
import 'package:nakhra/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:nakhra/features/authentication/screens/signup/signup.dart';
import 'package:nakhra/utils/constants/colors.dart';
import 'package:nakhra/utils/constants/image_strings.dart';
import 'package:nakhra/utils/constants/sizes.dart';
import 'package:nakhra/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formkey = GlobalKey<FormState>();
  final obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.to(() => OnboardingScreen()),
          icon: SvgPicture.asset(ZImages.backArrow),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: ZSpacingStyle.leftRightPadding,
              // login header
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //LoginPageHeader
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: ZSizes.spaceBtwItems),
                      Text(ZTexts.zLoginTitle, style: Theme.of(context).textTheme.headlineMedium),
                      const SizedBox(height: ZSizes.xs),
                      Text(
                        ZTexts.zLoginSubTitle,
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(color: ZColors.darkGrey, fontSize: 15.5),
                      ),
                      const SizedBox(height: ZSizes.customDefaultSpace),
                      //LoginPageForm
                      Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ZTexts.email,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(color: ZColors.black, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: ZSizes.xs),
                            TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ZColors.grey10,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ZColors.primary500),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ZColors.error),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ZColors.orange),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: 'Your email',
                                hintStyle: TextStyle(color: ZColors.borderDark),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email is Required';
                                }
                                if (!value.contains('@')) {
                                  return 'Invalid email format';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: ZSizes.md),
                            Text(
                              'Password',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(color: ZColors.black, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: ZSizes.xs),
                            TextFormField(
                              obscureText: obsecureText,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ZColors.softGrey,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ZColors.primary500),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ZColors.error),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ZColors.orange),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                errorMaxLines: 5,
                                hintText: 'Your password',
                                hintStyle: TextStyle(color: ZColors.borderDark),

                                suffixIcon: IconButton(
                                  style: IconButton.styleFrom(),
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    ZImages.outlinedEyeIcon,
                                    colorFilter: ColorFilter.mode(ZColors.gray400, BlendMode.srcIn),
                                  ),
                                ),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                              ),

                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is Required';
                                }
                                if (value.trim().length < 8) {
                                  return 'Password must contain:\n8+ characters\nOne letter\nOne symbol\nOne number';
                                }
                                if (!value.contains(RegExp(r'[ABCDEFGHIJKLMNOPQRSTUVWXYZ]'))) {
                                  return 'Password must contain an alphabet';
                                }
                                if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                                  return 'Special Character is Required';
                                }
                                if (!value.contains(RegExp(r'[0-9]'))) {
                                  return 'Password must contain a number';
                                }

                                return null;
                              },
                            ),
                            const SizedBox(height: ZSizes.sm),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                minimumSize: Size(0, 0),
                              ),
                              onPressed: () {},
                              child: Text(
                                ZTexts.zForgetPassword,
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  color: ZColors.primary500,
                                  fontSize: 15.3,
                                  // wordSpacing: 0,
                                  letterSpacing: 0.2,
                                ),
                              ),
                            ),
                            const SizedBox(height: ZSizes.lg),

                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(27)),
                                  backgroundColor: ZColors.primary500,
                                  // shadowColor: Colors.amber,
                                  // overlayColor: Colors.amber,
                                  side: BorderSide.none,
                                ),
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    ScaffoldMessenger.of(
                                      context,
                                    ).showSnackBar(SnackBar(content: Text('Successfull')));
                                  }
                                },
                                child: const Text(ZTexts.zLogin),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: ZSizes.spaceBtwSections),
            Align(
              alignment: Alignment.center,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: ZTexts.zDontHaveAnAccount,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ZColors.darkGrey,
                        // letterSpacing: 0,
                        // wordSpacing: 0,
                        // fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: ZTexts.zSignup,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.copyWith(color: ZColors.primary500, fontWeight: FontWeight.w600),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => const SignupScreen());
                        },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: ZSizes.spaceBtwSections),
            // Divider
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(child: Divider(color: ZColors.grey, endIndent: 5)),
                Text(
                  ZTexts.zOrWith,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: ZColors.darkGrey, fontWeight: FontWeight.w400),
                ),
                Flexible(child: Divider(color: ZColors.grey, indent: 5)),
              ],
            ),
            const SizedBox(height: ZSizes.md),
            Padding(
              padding: ZSpacingStyle.leftRightPadding,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(),
                      onPressed: () {},
                      icon: Padding(
                        padding: EdgeInsetsGeometry.only(right: 1),
                        child: SvgPicture.asset('assets/logo/google_logo.svg', width: 24, height: 24),
                      ),

                      label: Text(
                        "  ${ZTexts.zSignInWithGoogle}",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(height: ZSizes.spaceBtwoutlinedButtons),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(),
                      onPressed: () {},
                      icon: Padding(
                        padding: EdgeInsetsGeometry.only(right: 8),
                        child: SvgPicture.asset('assets/logo/apple_logo.svg', width: 24, height: 24),
                      ),
                      label: Text(
                        ZTexts.zSignInWithApple,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
