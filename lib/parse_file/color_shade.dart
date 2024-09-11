import 'package:flutter/material.dart';

Color darken(Color color, [double amount = .1]) {
  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
  return hslDark.toColor();
}

// Lightens a color by [amount] (0.0 to 1.0)
Color lighten(Color color, [double amount = .1]) {
  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
  return hslLight.toColor();
}



abstract class Shade {
  /// Convert int to ARBG
  static String hexFromArgb(int a, int r, int g, int b) {
    return '${a.toRadixString(16).padLeft(2, '0').toUpperCase()}'
        '${r.toRadixString(16).padLeft(2, '0').toUpperCase()}'
        '${g.toRadixString(16).padLeft(2, '0').toUpperCase()}'
        '${b.toRadixString(16).padLeft(2, '0').toUpperCase()}';
  }

  /// Convert hex to int
  static int intFromHex(String hex) {
    return int.tryParse(hex, radix: 16) ?? 0;
  }

  /// Mix colors from an amount
  static Color mixColors(Color argb1, Color argb2, double amount) {
    final p = amount / 100;

    final r = ((argb2.red - argb1.red) * p + argb1.red).floor();
    final g = ((argb2.green - argb1.green) * p + argb1.green).floor();
    final b = ((argb2.blue - argb1.blue) * p + argb1.blue).floor();
    final a = ((argb2.alpha - argb1.alpha) * p + argb1.alpha).floor();

    final hex = hexFromArgb(a, r, g, b);
    return Color(intFromHex(hex));
  }

  /// Multiply the two colors
  static Color multiply(Color argb1, Color argb2) {
    final a = argb1.alpha;
    final r = (argb1.red * argb2.red / 255).floor();
    final g = (argb1.green * argb2.green / 255).floor();
    final b = (argb1.blue * argb2.blue / 255).floor();

    final hex = hexFromArgb(a, r, g, b);
    return Color(intFromHex(hex));
  }

  /// Generate shades based on colorBase
  static MaterialColor swatch(Color colorBase) {
    const baseLight = Color(0xFFFFFFFF);
    final baseDark = multiply(colorBase, colorBase);

    return MaterialColor(
      colorBase.value,
      <int, Color>{
        50: mixColors(baseLight, colorBase, 12),
        100: mixColors(baseLight, colorBase, 30),
        200: mixColors(baseLight, colorBase, 50),
        300: mixColors(baseLight, colorBase, 70),
        400: mixColors(baseLight, colorBase, 85),
        500: colorBase,
        600: mixColors(baseDark, colorBase, 87),
        700: mixColors(baseDark, colorBase, 70),
        800: mixColors(baseDark, colorBase, 54),
        900: mixColors(baseDark, colorBase, 25),
      },
    );
  }
}

/// Extends the Color class to generate shades
extension ColorShadeExtension on Color {
  MaterialColor get swatch {
    return Shade.swatch(this);
  }

  Color get shade50 => swatch[50]!;
  Color get shade100 => swatch[100]!;
  Color get shade200 => swatch[200]!;
  Color get shade300 => swatch[300]!;
  Color get shade400 => swatch[400]!;
  Color get shade500 => swatch[500]!;
  Color get shade600 => swatch[600]!;
  Color get shade700 => swatch[700]!;
  Color get shade800 => swatch[800]!;
  Color get shade900 => swatch[900]!;
}
