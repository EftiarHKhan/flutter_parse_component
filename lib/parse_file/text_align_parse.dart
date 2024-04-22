import 'package:flutter/material.dart';

TextAlign parseTextAlign(String? align) {
  switch (align) {
    case 'start':
      return TextAlign.start;
    case 'center':
      return TextAlign.center;
    case 'end':
      return TextAlign.end;

  // Add more cases as needed for other alignment values
    default:
      return TextAlign.start; // Default to center if unknown value
  }
}