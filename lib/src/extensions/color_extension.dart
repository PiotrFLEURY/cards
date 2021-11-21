import 'package:flutter/painting.dart';

extension ColorExtenstion on Color {
  String toHexString() {
    return '${red.toRadixString(16)}${green.toRadixString(16)}${blue.toRadixString(16)}';
  }
}
