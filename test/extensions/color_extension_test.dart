import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cards/src/extensions/color_extension.dart';

main() {
  group('toHexString', () {
    // black color test
    test('black color should return 000000', () {
      expect(const Color(0xFF000000).toHexString(), '000000');
    });
    // white color test
    test('white color should return FFFFFF', () {
      expect(const Color(0xFFFFFFFF).toHexString(), 'FFFFFF');
    });
    // red color test
    test('red color should return FF0000', () {
      expect(const Color(0xFFFF0000).toHexString(), 'FF0000');
    });
    // green color test
    test('green color should return 00FF00', () {
      expect(const Color(0xFF00FF00).toHexString(), '00FF00');
    });
    // blue color test
    test('blue color should return 0000FF', () {
      expect(const Color(0xFF0000FF).toHexString(), '0000FF');
    });
  });
}
