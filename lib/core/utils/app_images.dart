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

  static String camera(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Assets.light.svg.cameraIcon
        : Assets.dark.svg.cameraIcon;
  }

  static String edit(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Assets.light.svg.editIcon
        : Assets.dark.svg.editIcon;
  }

  static String lock(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Assets.light.svg.lockIcon
        : Assets.dark.svg.lockIcon;
  }

  static String leftArrow(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Assets.light.svg.leftArrowIcon
        : Assets.dark.svg.leftArrowIcon;
  }

  static String badge(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Assets.light.svg.badgeIcon
        : Assets.dark.svg.badgeIcon;
  }

  static String email(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Assets.light.svg.emailIcon
        : Assets.dark.svg.emailIcon;
  }

  static String eye(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Assets.light.svg.eyeIcon
        : Assets.dark.svg.eyeIcon;
  }

  static String eyeCrossed(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Assets.light.svg.eyeCrossedIcon
        : Assets.dark.svg.eyeCrossedIcon;
  }

  static String home(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Assets.light.svg.homeIcon
        : Assets.dark.svg.homeIcon;
  }

  static String homeFilled(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Assets.light.svg.homeFilledIcon
        : Assets.dark.svg.homeFilledIcon;
  }

  static String search(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Assets.light.svg.searchIcon
        : Assets.dark.svg.searchIcon;
  }

  static String searchFilled(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Assets.light.svg.searchFilledIcon
        : Assets.dark.svg.searchFilledIcon;
  }

  static String add(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Assets.light.svg.addIcon
        : Assets.dark.svg.addIcon;
  }

  static String addFilled(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Assets.light.svg.addFilledIcon
        : Assets.dark.svg.addFilledIcon;
  }
}
