import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat.decimalPattern('en_US');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(
        text: '',
        selection: const TextSelection.collapsed(offset: 0),
      );
    }

    // Remove non-numeric characters except decimal point
    String cleaned = newValue.text.replaceAll(RegExp(r'[^\d.]'), '');

    // Ensure only one decimal point
    final parts = cleaned.split('.');
    if (parts.length > 2) {
      return oldValue; // Reject multiple decimal points
    }

    // Handle decimal point at the start
    if (cleaned.startsWith('.')) {
      cleaned = '0$cleaned';
    }

    // Limit decimal places to 7
    if (parts.length == 2 && parts[1].length > 7) {
      parts[1] = parts[1].substring(0, 7);
      cleaned = '${parts[0]}.${parts[1]}';
    }

    // Parse as double
    double? value = double.tryParse(cleaned);
    if (value == null) {
      return oldValue; // Invalid input, revert to old value
    }

    // Format number and remove trailing zeros
    String formatted = _formatter.format(value);
    if (formatted.contains('.')) {
      formatted =
          formatted.replaceAll(RegExp(r'0+$'), ''); // Remove trailing zeros
      formatted = formatted.replaceAll(
          RegExp(r'\.$'), ''); // Remove trailing decimal point
    }

    // Calculate cursor position
    bool isDeleting = newValue.text.length < oldValue.text.length;
    int oldCursorOffset =
        newValue.selection.baseOffset.clamp(0, newValue.text.length);
    String inputBeforeCursor = newValue.text.substring(0, oldCursorOffset);
    String cleanedBeforeCursor =
        inputBeforeCursor.replaceAll(RegExp(r'[^\d.]'), '');

    // Map cursor from cleaned input to formatted output
    int newCursorOffset = 0;
    int cleanedIndex = 0;

    if (isDeleting) {
      // For deletions, use old input to determine cursor position before deletion
      String oldInputBeforeCursor = oldValue.text.substring(
          0, oldValue.selection.baseOffset.clamp(0, oldValue.text.length));
      String oldCleanedBeforeCursor =
          oldInputBeforeCursor.replaceAll(RegExp(r'[^\d.]'), '');
      cleanedBeforeCursor = oldCleanedBeforeCursor;
      if (cleanedBeforeCursor.isNotEmpty) {
        cleanedBeforeCursor =
            cleanedBeforeCursor.substring(0, cleanedBeforeCursor.length - 1);
      }
    }

    for (int i = 0; i < formatted.length; i++) {
      if (cleanedIndex >= cleanedBeforeCursor.length) {
        newCursorOffset = i;
        break;
      }

      // Handle punctuation (commas, decimal point)
      if (formatted[i] == ',' || formatted[i] == '.') {
        newCursorOffset++;
        continue;
      }

      // Match digits
      if (cleanedIndex < cleanedBeforeCursor.length &&
          cleanedBeforeCursor[cleanedIndex] == formatted[i]) {
        cleanedIndex++;
        newCursorOffset++;
      } else {
        newCursorOffset++;
      }
    }

    // Ensure cursor stays within bounds
    newCursorOffset = newCursorOffset.clamp(0, formatted.length);

    // Fine-tune cursor for deletions
    if (isDeleting && newCursorOffset > 0) {
      // Move cursor left to position before the deleted character
      newCursorOffset--;
      // Skip commas or decimal point to land on a digit
      while (newCursorOffset > 0 &&
          (formatted[newCursorOffset - 1] == ',' ||
              formatted[newCursorOffset - 1] == '.')) {
        newCursorOffset--;
      }
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: newCursorOffset + 1),
    );
  }
}
