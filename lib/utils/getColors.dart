import 'package:flutter/material.dart';
import 'dart:core';

dynamic theme = {};

Map<String, Color> getColors(ColorScheme? colorScheme) {
  Color backgroundColor =
      colorScheme?.background ?? const Color.fromARGB(255, 13, 18, 12);
  Color secondaryContainer = colorScheme?.secondaryContainer ?? Colors.red;

  theme = {
    'backgroundColor': backgroundColor,
    secondaryContainer: secondaryContainer
  };
  return theme;
}
