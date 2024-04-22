import 'package:flutter/material.dart';

BoxFit parseBoxFit(String fit) {
  switch (fit) {
    case 'cover':
      return BoxFit.cover;
    case 'contain':
      return BoxFit.contain;
    case 'fill':
      return BoxFit.fill;
// Add more cases as needed for other BoxFit values
    default:
      return BoxFit.cover; // Default to BoxFit.cover if unknown value
  }
}