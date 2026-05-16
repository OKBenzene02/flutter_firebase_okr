import 'package:flutter/material.dart';
import 'package:instagram_posts/core/gen/assets.gen.dart';

class AppImages {
  static AssetGenImage instagram(BuildContext context) {
    return Assets.light.image.instagramLight;
  }

  static String like(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Assets.light.svg.likeIcon
        : Assets.dark.svg.likeIcon;
  }

  static String likeFilled(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Assets.light.svg.likeFilledIcon
        : Assets.dark.svg.likeFilledIcon;
  }

  static String comment(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Assets.light.svg.commentIcon
        : Assets.dark.svg.commentIcon;
  }

  static String commentFilled(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Assets.light.svg.commentFilledIcon
        : Assets.dark.svg.commentIcon;
  }

  static String send(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Assets.light.svg.sendIcon
        : Assets.dark.svg.sendIcon;
  }

  static String sendFilled(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Assets.light.svg.sendFilledIcon
        : Assets.dark.svg.sendFilledIcon;
  }

  static String bookmark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Assets.light.svg.bookmarkIcon
        : Assets.dark.svg.bookmarkIcon;
  }

  static String bookmarkFilled(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Assets.light.svg.bookmarkFilledIcon
        : Assets.dark.svg.bookmarkFilledIcon;
  }

  static String overflowMenu(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Assets.light.svg.overflowMenuIcon
        : Assets.dark.svg.overflowMenuIcon;
  }
}
