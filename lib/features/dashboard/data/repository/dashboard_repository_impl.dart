import 'package:instagram_posts/features/authentication/common/mappers.dart';
import 'package:instagram_posts/features/dashboard/data/service/dashboard_services.dart';
import 'package:instagram_posts/features/dashboard/domain/entities/posts_entity.dart';
import 'package:instagram_posts/features/dashboard/domain/repository/dashboard_repository.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  final DashboardServices _dashboardServices;

  DashboardRepositoryImpl({required DashboardServices dashboardServices})
    : _dashboardServices = dashboardServices;

  @override
  Stream<List<PostsEntity>> getDashboardContent() {
    final stream = _dashboardServices.getPosts();
    return stream.map((model) => model.map((post) => post.toEntity()).toList());
  }
}
