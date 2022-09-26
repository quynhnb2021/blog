import 'package:flutter/material.dart';
import 'package:blog/ui/themes/app_color.dart';

final boxShadow = [
  BoxShadow(
    color: AppColors.shadowColor,
    spreadRadius: 0,
    blurRadius: 4,
    offset: const Offset(0, 4),
  ),
];

final boxDecoration = BoxDecoration(
  border: Border.all(width: 1, color: AppColors.borderColor),
  borderRadius: const BorderRadius.all(Radius.circular(6)),
);
