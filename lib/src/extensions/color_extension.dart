import 'package:flutter/painting.dart';

extension ColorExtenstion on Color {
  String toHexString() => [
        _toHexChannel(red),
        _toHexChannel(green),
        _toHexChannel(blue),
      ].join().toUpperCase();

  String _toHexChannel(int channelValue) =>
      channelValue.toRadixString(16).padLeft(2, '0');
}
