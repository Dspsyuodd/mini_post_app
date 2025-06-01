import 'package:flutter/material.dart';
import 'package:mini_post_app/app.dart';
import 'package:mini_post_app/src/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  runApp(const App());
}

