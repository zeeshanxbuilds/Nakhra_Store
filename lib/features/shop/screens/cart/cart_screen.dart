import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nakhra/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:nakhra/utils/constants/image_strings.dart';
import 'package:nakhra/utils/constants/text_strings.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 2, left: 5, right: 5),
          child: Column(
            children: [
              HomeAppbar(title: "My Cart", leading: null, action: () {}),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(ZImages.bigCartIcon),
                      SizedBox(height: 30),
                      Text(
                        ZTexts.thereIsNoProduct,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
