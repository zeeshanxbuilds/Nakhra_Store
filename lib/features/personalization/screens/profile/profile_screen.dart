import 'package:flutter/material.dart';
import 'package:nakhra/features/shop/screens/home/widgets/home_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 2.0, left: 5, right: 5),
          child: SingleChildScrollView(
            child: Column(children: [HomeAppbar(title: "Profile", leading: null, action: null)]),
          ),
        ),
      ),
    );
  }
}
