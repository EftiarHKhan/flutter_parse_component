import 'package:flutter/services.dart';

TextInputFormatter parseInputType(String? formatterString) {
  switch (formatterString) {
    case 'text':
      return FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]'));
    case 'double':
      return FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]'));
    case 'int':
      return FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));
    case 'email':
      return FilteringTextInputFormatter.allow(
        RegExp(
          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
        ),
      );
    default:
      return FilteringTextInputFormatter.deny('');
  }
}