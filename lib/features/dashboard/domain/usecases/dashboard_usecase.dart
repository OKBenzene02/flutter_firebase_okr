import 'package:instagram_posts/features/dashboard/domain/entities/posts_entity.dart';
import 'package:instagram_posts/features/dashboard/domain/repository/dashboard_repository.dart';

class DashboardUsecase {
  final DashboardRepository _dashboardRepository;

  DashboardUsecase({required DashboardRepository dashboardRepository})
    : _dashboardRepository = dashboardRepository;

  Stream<List<PostsEntity>?> getPosts() {
    return _dashboardRepository.getDashboardContent();
  }
}
