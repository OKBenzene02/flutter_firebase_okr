import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_posts/core/utils/app_images.dart';
import 'package:instagram_posts/core/utils/custom_app_bar.dart';
import 'package:instagram_posts/core/utils/custom_banner.dart';
import 'package:instagram_posts/core/utils/custom_loaders.dart';
import 'package:instagram_posts/features/authentication/domain/entities/user_entity.dart';
import 'package:instagram_posts/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:instagram_posts/features/dashboard/presentation/widgets/post_card.dart';

class Dashboard extends StatefulWidget {
  final UserEntity? user;
  const Dashboard({super.key, required this.user});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardBloc>().add(LoadDashboardPostsEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
          child: AppImages.instagram(
            context,
          ).image(width: 24, fit: BoxFit.contain),
        ),
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            fontFamily: 'DancingScript',
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: BlocListener<DashboardBloc, DashboardState>(
        listener: (context, state) {
          if (state is DashboardErrorState) {
            CustomBanner.show(context, message: state.error);
          }
        },
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state is DashboardInitial) {
              CustomLoaders.showLoading();
              return const SizedBox.shrink();
            } else if (state is DashboardPostsSuccessState) {
              CustomLoaders.hideLoading();
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  return PostCard(post: post);
                },
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
