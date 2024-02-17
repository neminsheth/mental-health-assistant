import 'package:flutter/material.dart';
import 'package:ipd/home.dart'; // Make sure to import HomePage from home.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Mental Health',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
      ),
      home: HomePage(), // Ensure HomePage is used as the home widget
    );
  }
}
