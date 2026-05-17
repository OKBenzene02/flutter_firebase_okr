import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:instagram_posts/core/utils/app_images.dart';
import 'package:instagram_posts/core/utils/custom_image_widget.dart';
import 'package:instagram_posts/features/authentication/domain/entities/user_entity.dart';

enum BottomNavBarItem { dashboard, search, post, chat, profile }

class CustomBottomBar extends StatelessWidget {
  final BottomNavBarItem selectedTab;
  final Function(BottomNavBarItem) onTabSelected;
  final UserEntity? user;
  const CustomBottomBar({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
    this.user,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            height: 64,
            decoration: BoxDecoration(
              color: cs.surface.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: BottomNavBarItem.values
                    .map(
                      (tab) => _NavItem(
                        tab: tab,
                        isSelected: selectedTab == tab,
                        onTap: () => onTabSelected(tab),
                        user: user,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final BottomNavBarItem tab;
  final bool isSelected;
  final VoidCallback onTap;
  final UserEntity? user;

  const _NavItem({
    required this.tab,
    required this.isSelected,
    required this.onTap,
    this.user,
  });

  String _iconPath(BuildContext context) {
    switch (tab) {
      case .dashboard:
        return isSelected
            ? AppImages.homeFilled(context)
            : AppImages.home(context);
      case .search:
        return isSelected
            ? AppImages.searchFilled(context)
            : AppImages.search(context);
      case .post:
        return isSelected
            ? AppImages.addFilled(context)
            : AppImages.add(context);
      case .chat:
        return isSelected
            ? AppImages.sendFilled(context)
            : AppImages.send(context);
      case .profile:
        return ''; // handled separately
    }
  }

  // generates a consistent gradient per user based on their name
  List<Color> _gradientColors() {
    final name = user?.name ?? 'User';
    final hash = name.codeUnits.fold(0, (a, b) => a + b);
    final gradients = [
      [Colors.purple, Colors.pink],
      [Colors.blue, Colors.cyan],
      [Colors.orange, Colors.red],
      [Colors.green, Colors.teal],
      [Colors.indigo, Colors.purple],
    ];
    return gradients[hash % gradients.length];
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isProfile = tab == BottomNavBarItem.profile;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? cs.primary.withValues(alpha: 0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(
            20,
          ), // ← no shadow when unselected
        ),
        child: isProfile
            ? _buildProfileIcon()
            : CustomImageWidget.svg(
                assetPath: _iconPath(context),
                width: 22,
                height: 22,
                color: ColorFilter.mode(
                  isSelected ? cs.primary : cs.onSurface.withValues(alpha: 0.5),
                  BlendMode.srcIn,
                ),
              ),
      ),
    );
  }

  Widget _buildProfileIcon() {
    final hasImage =
        user?.profileImage != null && user!.profileImage!.isNotEmpty;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: hasImage
            ? null
            : LinearGradient(
                colors: _gradientColors(),
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
        border: Border.all(
          color: isSelected ? Colors.white : Colors.transparent,
          width: 2, // ← white ring when selected
        ),
      ),
      child: ClipOval(
        child: hasImage
            ? CustomImageWidget.cached(
                url: user!.profileImage,
                width: 28,
                height: 28,
                fit: BoxFit.cover,
              )
            : Center(
                child: Text(
                  (user?.name ?? 'U')[0].toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
      ),
    );
  }
}
