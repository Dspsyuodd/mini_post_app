import 'package:flutter/material.dart';
import 'package:mini_post_app/app_router.dart';
import 'package:mini_post_app/src/di.dart';
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
          ChangeNotifierProvider(
            create: (context) => sl<PostProvider>(),
          ),
          Provider(
            create: (context) => sl<PostPageController>(),
          ),
        ],
        child: const PostMainScreen(),
      ),
    );
  }
}
