import 'package:flutter/material.dart';

enum BackgroundColorOption { black, red, green, blue, yellow, purple, transparent }

extension BackgroundColorOptionX on BackgroundColorOption {
  Color get color {
    switch (this) {
      case BackgroundColorOption.black:
        return Colors.black;
      case BackgroundColorOption.red:
        return Colors.red;
      case BackgroundColorOption.green:
        return Colors.green;
      case BackgroundColorOption.blue:
        return Colors.blue;
      case BackgroundColorOption.yellow:
        return Colors.yellow;
      case BackgroundColorOption.purple:
        return Colors.purple;
      case BackgroundColorOption.transparent:
        return Colors.transparent;
    }
  }
}
