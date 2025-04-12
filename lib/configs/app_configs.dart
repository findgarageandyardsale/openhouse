class AppConfigs {
  static String url = 'http://54.209.76.200:8000';
  static String baseUrl = '$url/api/v1';

  static String loginEndpoint = '/home/user/login/';
  static String signupEndpoint = '/user/';

  static String requestEmailforgotPassword = '/user/password_forgot/';
  static String changeforgotPassword = '/user/forgot_password/';

  static String postSearchEndpoint = '/posts/search';

  static String yardSaleEndpoint = '/open_house/';
  static String mySaleEndpoint = '/open_house/my/sales/';

  static String changePasswordEndpoint = '/user/changed_password/';
  static String uploadAttachment = '/attachment/save_attachment/';
  static String postFeedback = '/open_house/rating/';

  static String getUserEndpoint({required String id}) => '/user/$id/';
  static String profileEndpoint = '/user/profile/';
  static String createSales = '/open_house/';
  static String payementSales = '/open_house/payment/';
  static String getCategory = '/category/';

  static String stripeEndpoint = 'https://api.stripe.com/v1/payment_intents';

  static String getPropertyType = '/type/';
}
