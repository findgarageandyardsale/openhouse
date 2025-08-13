import 'dart:io';

import 'package:intl/intl.dart';

class HelperConstant {
  static bool isForTest = true;

  static String stripeToken = isForTest
      ? 'sk_test_51QDJvOFxHDVNWRhzCnTKEV8rAxBtP5KeHhdjK4TyrbsdiBXDO3C6SGQLTCnMeWFSK51ugYhR8PnPdwBMPtFP3Z8C00tAX0lhRf'
      : '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';
  static String publishableStripeKey = isForTest
      ? 'pk_test_51QDJvOFxHDVNWRhzmKypSvvYzqfm2M4WHO62WlQ5G4KA0KDsHlitcetzZXuyVbQQoITHrmFPAgKZH0k9fhBTx2KR006kPfvUnz'
      : 'pk_live_51QDJvOFxHDVNWRhzmtSYJlGPwruutETFlcy9tz1H1C6F0GxY1RK5WKpGfbMoRpRg2gvXs2jej2Kx3qGghR5u4EP200clHRNhJN';

  static String merchantIdentifier =
      isForTest ? 'acct_1QDJvOFxHDVNWRhz' : 'acct_1QDJvOFxHDVNWRhz';
  static String playStoreAppStoreID = Platform.isAndroid
      ? 'https://play.google.com/store/apps/details?id=com.findorlookup.openhouse&hl=en_US&gl=US'
      : 'https://apps.apple.com/us/app/find-open-house/id6745729064';

  static String termsAndConditions =
      'https://docs.google.com/document/d/1HlWAa8n9T_rIJEp48tAz36C9BmbpQlY7cavZHUu8RrI/edit?tab=t.0';
  // 'https://findgarageandyardsale.com/#/terms-and-conditions';
  static String privacyPolicy =
      'https://findgarageandyardsale.com/#/privacy-policy';
  // 'https://docs.google.com/document/d/1HlWAa8n9T_rIJEp48tAz36C9BmbpQlY7cavZHUu8RrI/edit?tab=t.0'
  static String postPrice = '15';

  static int priceForEach = 15;

  static int numberOfPicCanUpload = 10;
  static String canUploadUptoMessage =
      'Your Image Limit has exceed. You can upload only ${HelperConstant.numberOfPicCanUpload} images';

  static String formatPrice(String value) {
    // if (value.isEmpty)
    return value;
    // final NumberFormat formatter = NumberFormat.decimalPattern('en_US');
    // // Clean input to remove non-numeric characters except decimal point
    // String cleaned = value.replaceAll(RegExp(r'[^\d.]'), '');
    // double? parsed = double.tryParse(cleaned);
    // if (parsed == null) return value; // Return original if invalid
    // String formatted = formatter.format(parsed);
    // if (formatted.contains('.')) {
    //   formatted =
    //       formatted.replaceAll(RegExp(r'0+$'), ''); // Remove trailing zeros
    //   formatted = formatted.replaceAll(
    //       RegExp(r'\.$'), ''); // Remove trailing decimal point
    // }
    // return formatted;
  }
}
