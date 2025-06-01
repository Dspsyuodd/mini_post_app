import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mini_post_app/src/api/post_api.dart';
import 'package:mini_post_app/src/domain/post_page_controller.dart';
import 'package:mini_post_app/src/domain/post_provider.dart';

final sl = GetIt.instance;

void initDependencies() {
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<PostApi>(() => PostApiImpl(sl()));
  sl.registerLazySingleton<PostProvider>(() => PostProvider(sl()));
  sl.registerLazySingleton<PostPageController>(() => PostPageController());
}