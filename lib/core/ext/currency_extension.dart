import 'package:intl/intl.dart';

extension Currency on double {
  String englishFormatCurrency() {
    // final reValue = this;

    // if (reValue % 1 == 0) {
    //   return reValue.toInt().toString();
    // }
    final result =
        NumberFormat.currency(locale: 'en_US', symbol: '\$').format(this);
    return result;
  }
  // Check if the value is an integer
//       if (value % 1 == 0) {
//         return value.toInt().toString();
//       }
}
