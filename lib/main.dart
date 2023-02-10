import 'package:flutter/material.dart';
import 'package:flutter_color_generation/home_page.dart';

void main() {
  runApp(const Main());
}

///The root widget of the application
class Main extends StatelessWidget {
  ///Creates a new instance of Main widget
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
