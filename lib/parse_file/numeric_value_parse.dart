int parseInt({required dynamic number, required int defaultValue}) {
  if (number is String) return int.tryParse(number) ?? defaultValue;
  if (number is int) return number;
  if (number is double) return number.toInt();

  return defaultValue;
}

double parseDouble({required dynamic number, required double defaultValue}) {
  if (number is String) return double.tryParse(number) ?? defaultValue;
  if (number is int) return number.toDouble();
  if (number is double) return number;
  return defaultValue;
}