import 'package:flutter/material.dart';

enum BackgroundColorOption { black, green, blue, yellow, transparent }

extension BackgroundColorOptionX on BackgroundColorOption {
  Color get color {
    switch (this) {
      case BackgroundColorOption.black:
        return Colors.grey.shade900;
      case BackgroundColorOption.green:
        return Colors.green;
      case BackgroundColorOption.blue:
        return Colors.blue;
      case BackgroundColorOption.yellow:
        return Colors.yellow;
      case BackgroundColorOption.transparent:
        return Colors.white;
    }
  }
}
