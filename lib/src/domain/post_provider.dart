import 'package:flutter/widgets.dart';
import 'package:mini_post_app/src/api/post_api.dart';
import 'package:mini_post_app/src/core/extensions/post_list_filter.dart';
import 'package:mini_post_app/src/models/posts_state.dart';

class PostProvider with ChangeNotifier {
  final PostApi _api;

  var _state = const PostsState.loading();
  var _filter = '';

  PostProvider(this._api);

  PostsState get state => _state;
  PostsState get filteredState => switch (state) {
    Data(:final data) => PostsState.data(
      data.filterBy(_filter),
    ),
    _ => state,
  };

  set filter(String filter) {
    _filter = filter;
    notifyListeners();
  }

  Future<void> fetchPosts() async {
    _setState(const PostsState.loading());
    try {
      final posts = await _api.getPosts();
      _setState(PostsState.data(posts));
    } on Object catch (e) {
      _setState(PostsState.error(e.toString()));
    }
  }

  void _setState(PostsState state) {
    _state = state;
    notifyListeners();
  }
}
