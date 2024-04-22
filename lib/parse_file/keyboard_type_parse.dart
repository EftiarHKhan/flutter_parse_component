import 'package:flutter/material.dart';

TextInputType parseKeyboardType(String? keyboardType) {
  switch (keyboardType) {
    case 'text':
      return TextInputType.text;
    case 'number':
      return TextInputType.number;
    case 'phone':
      return TextInputType.phone;
    case 'datetime':
      return TextInputType.datetime;
    case 'multiline':
      return TextInputType.multiline;
    case 'email':
      return TextInputType.emailAddress;
    case 'url':
      return TextInputType.url;
    case 'visible-password':
      return TextInputType.visiblePassword;
    case 'name':
      return TextInputType.name;
    case 'street-address':
      return TextInputType.streetAddress;

    case 'none':
      return TextInputType.none;
    case 'phoneNumber':
      return TextInputType.phone;
    case 'signedNumber':
      return const TextInputType.numberWithOptions(signed: true);
    case 'decimalNumber':
      return const TextInputType.numberWithOptions(decimal: true);
    case 'decimal':
      return const TextInputType.numberWithOptions(decimal: true);
    case 'textUri':
      return TextInputType.text;
    case 'numberUri':
      return TextInputType.number;
  // Add more cases as needed for other TextInputType values
    default:
      return TextInputType
          .text; // Default to TextInputType.text if unknown value
  }
}