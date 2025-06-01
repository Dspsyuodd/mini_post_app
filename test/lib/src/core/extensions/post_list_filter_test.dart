import 'package:flutter_test/flutter_test.dart';

import 'package:mini_post_app/src/core/extensions/post_list_filter.dart';
import 'package:mini_post_app/src/models/post.dart';

void main() {
  final testPosts = [
    const Post(id: 1, title: 'flutter', body: 'body1'),
    const Post(id: 2, title: 'Hello World', body: 'body2'),
    const Post(id: 3, title: 'Flutter is great', body: 'body3'),
    const Post(id: 4, title: 'dart', body: 'body4'),
  ];

  group('PostListFilterX', () {
    test('should return original list when query is empty', () {
      final result = testPosts.filterBy('');
      expect(result, equals(testPosts));
      expect(result.length, equals(testPosts.length));
    });

    test('should filter posts', () {
      final result = testPosts.filterBy('flutter');
      expect(result.length, equals(2));
      expect(
        result.every((post) =>
            post.title.toLowerCase().contains('flutter')),
        isTrue,
      );
    });

    test('should return empty list when no matches found', () {
      final result = testPosts.filterBy('kotlin');
      expect(result, isEmpty);
    });
  });
}