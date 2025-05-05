import 'package:intl/intl.dart';

extension Currency on double {
  String englishFormatCurrency() {
    final result =
        NumberFormat.currency(locale: 'en_US', symbol: '\$').format(this);
    return result;
  }
}
