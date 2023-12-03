import 'package:flutter/material.dart';
import 'package:movies_app/controllers/movies_controller.dart';
import 'package:movies_app/controllers/navigation_controller.dart';
import 'package:movies_app/views/navigation/navigation_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value:NavigationController(),
        ),
        ChangeNotifierProvider.value(
          value:MoviesController(),
        ),
      ],
      child: MaterialApp(
        title: 'Movie App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: NavigationScreen(),
      ),
    );
  }
}
