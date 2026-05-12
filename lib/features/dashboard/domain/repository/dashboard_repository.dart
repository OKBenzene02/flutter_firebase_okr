import 'package:instagram_posts/features/dashboard/domain/entities/posts_entity.dart';

abstract class DashboardRepository {
  Stream<List<PostsEntity>?> getDashboardContent();
}
