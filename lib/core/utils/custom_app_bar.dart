import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:instagram_posts/core/utils/app_images.dart';
import 'package:instagram_posts/core/utils/custom_image_widget.dart';
import 'package:instagram_posts/core/utils/navigation_helper.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final double blurStrength;
  final double opacity;
  final bool showBack;

  const CustomAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.blurStrength = 10,
    this.opacity = 0.1,
    this.showBack = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurStrength, sigmaY: blurStrength),
        child: Container(
          height: preferredSize.height + MediaQuery.of(context).padding.top,
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.surface.withValues(alpha: opacity),
          ),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  // ✅ show leading, or auto back button, or nothing
                  if (leading != null) ...[
                    leading!,
                    const SizedBox(width: 8),
                  ] else if (showBack && Navigator.canPop(context)) ...[
                    GestureDetector(
                      onTap: () => NavigationHelper.pop(),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: Center(
                          child: CustomImageWidget.svg(
                            assetPath: AppImages.leftArrow(context),
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],

                  // ✅ fixed — no ?title syntax
                  if (title != null) title!,

                  const Spacer(),

                  if (actions != null) ...actions!,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
