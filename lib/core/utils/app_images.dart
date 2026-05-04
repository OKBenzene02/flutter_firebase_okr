import 'package:flutter/material.dart';
import 'package:instagram_posts/core/gen/assets.gen.dart';

class AppImages {
  static AssetGenImage instagram(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Assets.dark.image.instagramDark
        : Assets.light.image.instagramLight;
  }
}