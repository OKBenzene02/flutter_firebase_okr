import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:instagram_posts/core/utils/custom_loaders.dart';
import 'package:instagram_posts/features/dashboard/domain/entities/posts_entity.dart';
import 'package:instagram_posts/features/dashboard/domain/usecases/dashboard_usecase.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardUsecase _dashboardUsecase;
  StreamSubscription<List<PostsEntity>?>? _postsSubscription;

  DashboardBloc({required DashboardUsecase dashboardUsecase})
    : _dashboardUsecase = dashboardUsecase,
      super(DashboardInitial()) {
    on<LoadDashboardPostsEvent>(_onLoadPosts);
  }

  Future<void> _onLoadPosts(
    LoadDashboardPostsEvent event,
    Emitter<DashboardState> emit,
  ) async {
    CustomLoaders.showLoading();
    try {
      await emit.forEach<List<PostsEntity>?>(
        _dashboardUsecase.getPosts(),
        onData: (posts) {
          CustomLoaders.hideLoading();
          return DashboardPostsSuccessState(posts: posts ?? []);
        },
        onError: (e, _) {
          CustomLoaders.hideLoading();
          return DashboardErrorState(error: e.toString());
        },
      );
    } catch (e) {
      emit(DashboardErrorState(error: e.toString()));
      CustomLoaders.hideLoading();
    }
  }
}
