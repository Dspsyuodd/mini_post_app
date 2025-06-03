import 'package:dio/dio.dart';
import 'package:mini_post_app/src/api/post_api_paths.dart';
import 'package:mini_post_app/src/models/post.dart';

abstract interface class PostApi {
  Future<List<Post>> getPosts();
}

class PostApiImpl implements PostApi {
  final Dio _dio;

  PostApiImpl(this._dio);

  @override
  Future<List<Post>> getPosts() async {
    final response = await _dio.get(
      ApiPaths.postApi,
    );

    return (response.data as List)
        .cast<Map<String, dynamic>>()
        .map(Post.fromJson)
        .toList();
  }
}
