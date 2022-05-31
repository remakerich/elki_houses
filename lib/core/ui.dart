import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final theme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ),
  ),
);

const kOutsideGap = 16.0;
const kBorderRadius = 16.0;
const Color kPrimaryColor = Color(0xFF746DF7);
const Color kInactiveColor = Color(0xFFEDEDED);
const Color kShadowColor = Color.fromRGBO(67, 49, 117, 0.15);