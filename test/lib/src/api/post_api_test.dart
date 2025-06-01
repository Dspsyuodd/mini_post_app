import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mini_post_app/src/api/post_api.dart';
import 'package:mini_post_app/src/api/post_api_paths.dart';
import 'package:mini_post_app/src/models/post.dart';

import 'post_api_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late PostApi api;

  setUp(() {
    mockDio = MockDio();
    api = PostApiImpl(mockDio);
  });

  group('PostApi', () {
    group('getPosts', () {
      test('should return list of posts on successful response', () async {
        final mockData = [
          {'id': 1, 'title': 'title1', 'body': 'body1'},
          {'id': 2, 'title': 'title2', 'body': 'body2'},
        ];

        when(
          mockDio.get(ApiPaths.postApi),
        ).thenAnswer(
          (_) async => Response(
            data: mockData,
            statusCode: 200,
            requestOptions: RequestOptions(path: ApiPaths.postApi),
          ),
        );

        final posts = await api.getPosts();

        expect(posts, isA<List<Post>>());
        verify(mockDio.get(ApiPaths.postApi)).called(1);
        expect(posts.length, 2);
        expect(posts[0].title, 'title1');
        expect(posts[1].title, 'title2');
      });

      test(
        'should throw when response data contains invalid post format',
        () async {
          final mockData = [
            {'aaa': 'bbb'},
          ];

          when(
            mockDio.get(ApiPaths.postApi),
          ).thenAnswer(
            (_) async => Response(
              data: mockData,
              statusCode: 200,
              requestOptions: RequestOptions(path: ApiPaths.postApi),
            ),
          );

          expect(
            () => api.getPosts(),
            throwsA(isA<TypeError>()),
          );
        },
      );

      test('should throw on error', () async {
        when(
          mockDio.get(ApiPaths.postApi),
        ).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: ApiPaths.postApi),
            error: 'some erorr',
          ),
        );

        expect(
          () => api.getPosts(),
          throwsA(isA<DioException>()),
        );
      });
    });
  });
}
