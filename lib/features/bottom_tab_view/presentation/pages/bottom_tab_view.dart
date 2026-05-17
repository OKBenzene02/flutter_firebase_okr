import 'package:flutter/material.dart';
import 'package:instagram_posts/features/authentication/domain/entities/user_entity.dart';
import 'package:instagram_posts/features/bottom_tab_view/presentation/widgets/custom_bottom_bar.dart';
import 'package:instagram_posts/features/dashboard/presentation/pages/dashboard.dart';

class BottomTabView extends StatefulWidget {
  final UserEntity? user;
  const BottomTabView({super.key, this.user});

  @override
  State<BottomTabView> createState() => _BottomTabViewState();
}

class _BottomTabViewState extends State<BottomTabView> {
  BottomNavBarItem _selectedTab = .dashboard;

  Widget _buildPage() {
    switch (_selectedTab) {
      case .dashboard:
        return Dashboard(user: widget.user);
      case .search:
        return const Center(child: Text('Search'));
      case .post:
        return const Center(child: Text('New Post'));
      case .chat:
        return const Center(child: Text('Messages'));
      case .profile:
        return const Center(child: Text('Profile'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: KeyedSubtree(
          key: ValueKey(_selectedTab),
          child: _buildPage(),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        selectedTab: _selectedTab,
        onTabSelected: (tab) => setState(() => _selectedTab = tab),
        user: widget.user,
      ),
    );
  }
}
