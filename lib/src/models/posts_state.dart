import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_post_app/src/models/post.dart';

part 'posts_state.freezed.dart';

@freezed
sealed class PostsState with _$PostsState {
  const factory PostsState.loading() = Loading;
  const factory PostsState.data(List<Post> data) = Data;
  const factory PostsState.error([Object? error]) = Error;
}