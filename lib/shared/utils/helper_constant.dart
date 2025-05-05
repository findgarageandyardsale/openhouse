import 'dart:io';

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
      ? 'https://play.google.com/store/apps/details?id=com.sale.garageyard&hl=en_US&gl=US'
      : 'https://apps.apple.com/us/app/garageyard/6737464722';

  static String termsAndConditions =
      'https://findgarageandyardsale.com/#/terms-and-conditions';
  static String privacyPolicy =
      'https://findgarageandyardsale.com/#/privacy-policy';
  static String postPrice = '15';

  static int priceForEach = 15;

  static int numberOfPicCanUpload = 10;
  static String canUploadUptoMessage =
      'Your Image Limit has exceed. You can upload only ${HelperConstant.numberOfPicCanUpload} images';
}
