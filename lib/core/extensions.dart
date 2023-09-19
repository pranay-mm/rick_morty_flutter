import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  Size get mediaQuerySize => MediaQuery.of(this).size;

  double get height => mediaQuerySize.height;
  double get width => mediaQuerySize.width;

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
