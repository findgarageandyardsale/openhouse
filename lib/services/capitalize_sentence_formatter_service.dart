import 'package:flutter/services.dart';

class CapitalizeSentenceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // If the text is empty, return as is
    if (newValue.text.isEmpty) return newValue;

    // If we're deleting text (backspace), return the new value as is
    if (newValue.text.length < oldValue.text.length) {
      return newValue;
    }

    // If we're just moving the cursor without text changes, return as is
    if (newValue.text == oldValue.text &&
        newValue.selection.baseOffset != oldValue.selection.baseOffset) {
      return newValue;
    }

    final text = newValue.text;
    final oldText = oldValue.text;
    final oldCursorPosition = oldValue.selection.baseOffset;
    final newCursorPosition = newValue.selection.baseOffset;

    // If the text hasn't changed, return as is
    if (text == oldText) {
      return newValue;
    }

    // Find the sentence boundaries
    final sentenceBoundaries = <int>[];
    for (int i = 0; i < text.length; i++) {
      if (i > 0 &&
          (text[i - 1] == '.' || text[i - 1] == '!' || text[i - 1] == '?') &&
          (i < text.length - 1 && text[i] == ' ')) {
        // Add the position after the space
        sentenceBoundaries.add(i + 1);
      }
    }
    sentenceBoundaries.insert(0, 0); // Add start of text

    // Process each sentence
    final buffer = StringBuffer();
    int cursorOffset = 0;
    bool cursorPositionFound = false;

    for (int i = 0; i < sentenceBoundaries.length; i++) {
      final start = sentenceBoundaries[i];
      final end = i < sentenceBoundaries.length - 1
          ? sentenceBoundaries[i + 1]
          : text.length;
      String sentence = text.substring(start, end);

      // Skip empty sentences
      if (sentence.trim().isEmpty) {
        buffer.write(sentence);
        continue;
      }

      // Capitalize first letter of sentence
      if (sentence.isNotEmpty) {
        final firstChar = sentence[0].toUpperCase();
        final restOfSentence = sentence.substring(1);
        sentence = firstChar + restOfSentence;
      }

      // Handle cursor position
      if (!cursorPositionFound &&
          newCursorPosition >= start &&
          newCursorPosition <= end) {
        // For cursor position, we don't need to calculate offset
        // since we're just capitalizing letters
        cursorOffset = 0;
        cursorPositionFound = true;
      }

      buffer.write(sentence);
    }

    final formattedText = buffer.toString();
    final finalCursorPosition = newCursorPosition + cursorOffset;

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(
        offset: finalCursorPosition.clamp(0, formattedText.length),
      ),
    );
  }
}
