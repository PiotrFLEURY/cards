import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_item.freezed.dart';

/// A placeholder class that represents an entity or model.
@freezed
class CardItem with _$CardItem {
  factory CardItem({
    required String id,
    required String color,
    required String label,
  }) = _CardItem;
}

extension HexExtension on String {
  Color toColor() {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) buffer.write('ff');
    buffer.write(this);
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  SvgPicture toBarcode({
    required BuildContext context,
    required double height,
  }) {
    return SvgPicture.string(
        Barcode.code93().toSvg(
          this,
          width: 250,
          height: 100,
          drawText: false,
        ),
        height: MediaQuery.of(context).size.height * 0.1);
  }
}
