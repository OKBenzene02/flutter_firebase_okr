part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

class DashboardPostsSuccessState extends DashboardState {
  final List<PostsEntity>? posts;

  DashboardPostsSuccessState({required this.posts});
}

class DashboardErrorState extends DashboardState {
  final String error;

  DashboardErrorState({required this.error});
}
