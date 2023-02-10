import 'dart:math';

import 'package:flutter/material.dart';

///The home widget of the application
class HomePage extends StatefulWidget {
  ///Creates a new instance of HomePage widget
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _backgroundColor = Colors.white;
  Color _textColor = Colors.black;
  bool _splitScreenHorizontally = false;
  Color _splitBackgroundColor = Colors.blue;
  final double halfSize = 0.5;
  final int alphaNumber = 255;
  final int maxRangeRandomNumber = 256;
  final double fontSize = 50;

  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = Color.fromARGB(
        alphaNumber,
        Random().nextInt(maxRangeRandomNumber),
        Random().nextInt(maxRangeRandomNumber),
        Random().nextInt(maxRangeRandomNumber),
      );
      if (_splitScreenHorizontally) {
        _splitBackgroundColor = Color.fromARGB(
          alphaNumber,
          Random().nextInt(maxRangeRandomNumber),
          Random().nextInt(maxRangeRandomNumber),
          Random().nextInt(maxRangeRandomNumber),
        );
      }
    });
  }

  void _changeTextColor() {
    setState(() {
      _textColor = Color.fromARGB(
        alphaNumber,
        Random().nextInt(maxRangeRandomNumber),
        Random().nextInt(maxRangeRandomNumber),
        Random().nextInt(maxRangeRandomNumber),
      );
    });
  }

  void _splitScreen() {
    setState(() {
      _splitScreenHorizontally = !_splitScreenHorizontally;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeBackgroundColor,
      onDoubleTap: _changeTextColor,
      onLongPress: _splitScreen,
      child: Scaffold(
        backgroundColor: _backgroundColor,
        body: Stack(
          children: [
            if (_splitScreenHorizontally)
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * halfSize,
                  width: double.infinity,
                  color: _splitBackgroundColor,
                ),
              ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hey there",
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: _textColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
