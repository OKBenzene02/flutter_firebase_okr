import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_posts/core/utils/app_images.dart';
import 'package:instagram_posts/features/authentication/domain/entities/user_entity.dart';
import 'package:instagram_posts/features/authentication/presentation/bloc/auth_bloc_bloc.dart';

class Dashboard extends StatefulWidget {
  final UserEntity? user;
  const Dashboard({super.key, required this.user});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsetsGeometry.symmetric(vertical: 12),
          child: AppImages.instagram(context).image(width: 8, fit: .contain),
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          'Instagram',
          style: TextStyle(
            fontSize: 24,
            fontWeight: .w900,
            fontFamily: 'DancingScript',
            letterSpacing: 1.5,
          ),
        ),
        bottomOpacity: 1,
      ),
      body: BlocConsumer<AuthBlocBloc, AuthBlocState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Center(
            child: Column(
              children: [
                Text('This is the Dashboard of the user ${widget.user?.name}'),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthBlocBloc>().add(AuthSignOutEvent());
                  },
                  child: Text('Sign Out'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
