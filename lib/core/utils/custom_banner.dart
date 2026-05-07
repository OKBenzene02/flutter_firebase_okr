import 'package:flutter/material.dart';

enum BannerType { success, error }

class CustomBanner {
  static void show(
    BuildContext context, {
    String? message = "",
    BannerType bannerType = .success,
  }) {
    final isSuccess = bannerType == .success;

    final messenger = ScaffoldMessenger.of(context);

    messenger
      ..hideCurrentMaterialBanner()
      ..showMaterialBanner(
        MaterialBanner(
          dividerColor: isSuccess ? Colors.lightGreenAccent : Colors.red,
          content: Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 16, horizontal: 4),
            child: Row(
              spacing: 16,
              children: [
                Icon(
                  isSuccess
                      ? Icons.check_circle_outline_rounded
                      : Icons.error_outline_rounded,
                  color: isSuccess ? Colors.lightGreenAccent : Colors.red,
                ),
                Expanded(
                  child: Text(
                    message ?? '',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: .w500,
                      color: isSuccess ? Colors.lightGreenAccent : Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: const [SizedBox.shrink()],
        ),
      );

    Future.delayed(const Duration(seconds: 4), () {
      messenger.hideCurrentMaterialBanner();
    });
  }
}
