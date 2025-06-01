import 'package:mini_post_app/src/models/post.dart';

extension PostListFilterX on List<Post> {
  List<Post> filterBy(String query) {
    if (query.isEmpty) return this;
    final q = query.toLowerCase();
    return where(
      (p) => p.title.toLowerCase().contains(q),
    ).toList();
  }
}
