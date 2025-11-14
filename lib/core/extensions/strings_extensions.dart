extension StringExtensions on String? {
  /// Returns true if the string is a valid email
  bool get isEmail =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this ?? '');

  /// Returns true if the string is a valid phone
  bool get isPhone => RegExp(r'^\+?\d{7,15}$').hasMatch(this ?? '');

  /// Returns true if the string is null or empty
  bool get isNullOrEmpty => this == '' || this == null;

  /// Returns true if the string is not null or empty
  bool get isNotNullOrEmpty => this != '' && this != null;
}

extension SafeList<T> on List<T>? {
  /// Returns the first element of the list
  T? get firstOrNull => (this != null && this!.isNotEmpty) ? this!.first : null;
}
