import 'package:flutter/material.dart';
import 'package:movies_app/core/services/service_locator.dart';

import 'movies_module/presentation/screens/movies_screen.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
        home: MainMoviesScreen()
    );
  }
}
