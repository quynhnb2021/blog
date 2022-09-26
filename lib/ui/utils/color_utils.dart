import 'package:flutter/material.dart';

String convertColorToString(Color color) {
  final String hex = color.value.toRadixString(16);
  final String hexString = '#${hex.substring(2, hex.length)}';
  return hexString;
}

Color convertHexColorToColor(String hexColor) {
  if (hexColor.isEmpty) {
    return Colors.orange;
  }
  final String hexString = '0xff${hexColor.substring(1, hexColor.length)}';
  final int hexValue = int.parse(hexString);
  return Color(hexValue);
}
