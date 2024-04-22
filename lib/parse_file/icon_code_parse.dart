String parseIconCode(String input) {
  // Remove 'Icon' prefix
  if (input.startsWith('Icon')) {
    input = input.substring(4);
  }
  // Convert camel case to snake case
  String result =
  input.replaceAllMapped(RegExp(r'(?<=[a-zA-Z])([0-9])|([A-Z])'), (match) {
    // Add underscore before digit following a letter
    if (match.group(1) != null) {
      return '_${match.group(1)}';
    }
    // Convert uppercase letter to lowercase with preceding underscore
    return '_${match.group(2)!.toLowerCase()}';
  });
  // Remove leading underscore if present
  if (result.startsWith('_')) {
    result = result.substring(1);
  }
  if (result.contains('-')) result = result.replaceAll('-', '_');
  return result;
}