part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}

class LoadDashboardPostsEvent extends DashboardEvent {}
class RefreshDashboardPostsEvent extends DashboardEvent {}