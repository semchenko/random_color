import 'dart:math';

import 'package:flutter/material.dart';

const _maxByteValue = 256;
const _message = "Hello there";

void main() {
  runApp(const ChangeableColors());
}

/// Just a simple test widget that changes its colors when tapping
class ChangeableColors extends StatefulWidget {
  /// constructor
  const ChangeableColors({super.key});

  @override
  State<ChangeableColors> createState() => _ChangeableColorsState();
}

class _ChangeableColorsState extends State<ChangeableColors> {
  late Color _backgroundColor;
  late Color _messageColor;

  @override
  void initState() {
    _setNewLook();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: GestureDetector(
        onTap: _setNewLook,
        child: ColoredBox(
          color: _backgroundColor,
          child: Center(
            child: Text(
              _message,
              style: TextStyle(
                color: _messageColor,
                fontSize: 48,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getRandomColor() {
    final random = Random();
    return Color.fromRGBO(
      random.nextInt(_maxByteValue),
      random.nextInt(_maxByteValue),
      random.nextInt(_maxByteValue),
      1.0,
    );
  }

  void _setNewLook() {
    setState(() {
      _backgroundColor = _getRandomColor();
      _messageColor = _getRandomColor();
    });
  }
}
