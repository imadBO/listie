import 'package:flutter/material.dart';
import 'package:listie_flutter/utils/colors_manager.dart';

class ThemesManager {
  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.primary,
      brightness: Brightness.dark,
    ),
  );
}
