import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mini_post_app/app_router.dart';
import 'package:mini_post_app/src/api/post_api.dart';
import 'package:mini_post_app/src/domain/post_page_controller.dart';
import 'package:mini_post_app/src/domain/post_provider.dart';
import 'package:mini_post_app/src/ui/pages/post_main_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: MultiProvider(
        providers: [
          Provider(create: (context) => Dio()),
          Provider<PostApi>(
            create: (context) => PostApiImpl(context.read()),
          ),
          ChangeNotifierProvider(
            create: (context) => PostProvider(context.read()),
          ),
          Provider(
            create: (context) => PostPageController(),
          ),
        ],
        child: const PostMainScreen(),
      ),
    );
  }
}
