class ConvertTo {
  static double? convertIntToDouble(value) {
    return value == null
        ? null
        : (value is int)
            ? value.toDouble()
            : (value is String)
                ? double.parse(value.toString())
                : value;
  }
}
