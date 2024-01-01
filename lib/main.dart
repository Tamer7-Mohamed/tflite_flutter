import 'dart:async';
import 'package:flutter/material.dart';
import 'home.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'tflite real-time detection',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const HomePage(),
    );
  }
}
