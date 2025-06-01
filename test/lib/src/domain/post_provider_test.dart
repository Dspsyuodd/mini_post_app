import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_post_app/src/domain/post_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mini_post_app/src/api/post_api.dart';
import 'package:mini_post_app/src/models/post.dart';
import 'package:mini_post_app/src/models/posts_state.dart';

import 'post_provider_test.mocks.dart';

@GenerateMocks([PostApi])
void main() {
  late MockPostApi mockApi;
  late PostProvider provider;

  final mockPosts = [
    const Post(id: 1, title: 't1', body: 'b1'),
    const Post(id: 2, title: 't2', body: 'b2'),
    const Post(id: 3, title: 't3', body: 'b3'),
  ];

  setUp(() {
    mockApi = MockPostApi();
    provider = PostProvider(mockApi);
  });

  group('PostProvider', () {
    test('initial state should be loading', () {
      expect(provider.state, const PostsState.loading());
    });

    group('fetchPosts', () {
      test('should update state to data on successful fetch', () async {
        when(
          mockApi.getPosts(),
        ).thenAnswer((_) async => mockPosts);

        await provider.fetchPosts();

        expect(provider.state, PostsState.data(mockPosts));
        verify(mockApi.getPosts()).called(1);
      });

      test('should update state to error on fetch failure', () async {
        final error = Exception('some error');
        when(
          mockApi.getPosts(),
        ).thenThrow(error);

        await provider.fetchPosts();

        expect(provider.state, PostsState.error(error.toString()));
        verify(mockApi.getPosts()).called(1);
      });

      test('should set loading state before fetching', () async {
        final completer = Completer<List<Post>>();
        when(
          mockApi.getPosts(),
        ).thenAnswer((_) => completer.future);

        provider.fetchPosts();

        expect(provider.state, const PostsState.loading());
      });
    });

    group('filtering', () {
      setUp(() async {
        when(
          mockApi.getPosts(),
        ).thenAnswer((_) async => mockPosts);
        await provider.fetchPosts();
      });

      test('should not filter when filter is empty', () {
        provider.filter = '';
        expect(
          provider.filteredState,
          PostsState.data(mockPosts),
        );
      });

      test('should filter posts by title', () {
        provider.filter = 't1';

        final filteredState = provider.filteredState;
        expect(filteredState, isA<Data>());

        switch (filteredState) {
          case Data(:final data):
            expect(data.length, 1);
            expect(data.first.title, 't1');
          case _:
            fail('wrong state');
        }
      });
    });
  });
}
