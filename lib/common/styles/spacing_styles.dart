import 'package:flutter/material.dart';
import 'package:nakhra/utils/constants/sizes.dart';
import 'package:nakhra/utils/device/device_utility.dart';

class ZSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: ZSizes.appBarHeight,
    right: ZSizes.defaultSpace,
    left: ZSizes.defaultSpace,
    bottom: ZSizes.defaultSpace,
  );
  static const EdgeInsetsGeometry paddingWithoutAppBarHeight = EdgeInsetsGeometry.only(
    left: ZSizes.defaultSpace,
    right: ZSizes.defaultSpace,
    bottom: ZSizes.defaultSpace,
  );
  static const EdgeInsetsGeometry leftRightPadding = EdgeInsetsGeometry.only(
    left: ZSizes.defaultSpace,
    right: ZSizes.defaultSpace,
  );
}
