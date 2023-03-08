import 'package:flutter/material.dart';
import 'package:movies_app/Movies/presentation/screens/movies_screen.dart';
import 'package:movies_app/Movies/presentation/screens/now_playing_screen.dart';
import 'package:movies_app/core/services/services_locator.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies Demo',
      theme: ThemeData(
  
        primarySwatch: Colors.blue,
      ),
      home: const MovieScreen(),
    );
  }
}