import 'package:flutter/material.dart';

class CustomBouncingScrollPhysics extends BouncingScrollPhysics {
  const CustomBouncingScrollPhysics({super.parent});

  @override
  CustomBouncingScrollPhysics applyTO(ScrollPhysics? ancestors) {
    return CustomBouncingScrollPhysics(parent: buildParent(ancestors));
  }

  @override
  SpringDescription get spring {
    return const SpringDescription(mass: 1.0, stiffness: 10.0, damping: 10.0);
  }
}
