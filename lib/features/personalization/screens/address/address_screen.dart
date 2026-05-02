import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:nakhra/utils/constants/image_strings.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Favorites"), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              ZImages.locationAnimation,
              repeat: true,
              frameRate: FrameRate(60),
              reverse: false,
              animate: true,
            ),
          ),
          Center(child: Text("Not Implemented Yet")),
        ],
      ),
    );
  }
}
