import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:oktoast/oktoast.dart';
import 'package:open_house/shared/utils/helper_constant.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'routes/app_route.dart';
import 'shared/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //FlutterBranchSdk.setPreinstallCampaign('My Campaign Name');
  //FlutterBranchSdk.setPreinstallPartner('Branch \$3p Parameter Value');
  //FlutterBranchSdk.clearPartnerParameters();
  /*
  FlutterBranchSdk.addFacebookPartnerParameter(
      key: 'em',
      value:
          '11234e56af071e9c79927651156bd7a10bca8ac34672aba121056e2698ee7088');
  FlutterBranchSdk.addSnapPartnerParameter(
      key: 'hashed_email_address',
      value:
          '11234e56af071e9c79927651156bd7a10bca8ac34672aba121056e2698ee7088');
  FlutterBranchSdk.setRequestMetadata('key1', 'value1');
  FlqutterBranchSdk.setRequestMetadata('key2', 'value2');
  */

  try {
    Stripe.publishableKey = HelperConstant.publishableStripeKey;
    Stripe.merchantIdentifier = HelperConstant.merchantIdentifier;
    await Stripe.instance.applySettings();
  } catch (e) {
    log('Stripe Initialization Error: $e');
  }

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ),
  );

  runApp(
    ProviderScope(
      observers: [
        // Observers(),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeProvider);

    return OKToast(
      child: MaterialApp.router(
        title: 'Find Open House',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeMode,
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: appRouter.delegate(),
        debugShowCheckedModeBanner: false,
        builder: (context, widget) {
          final MediaQueryData data = MediaQuery.of(context);

          return ResponsiveBreakpoints.builder(
            breakpoints: [
              const Breakpoint(start: 0, end: 600, name: MOBILE),
              const Breakpoint(start: 601, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1200, name: DESKTOP),
            ],
            child: MediaQuery(
              data: data.copyWith(textScaler: const TextScaler.linear(1.1)),
              child: widget!, // updated line
            ),
          );
        },
      ),
    );
  }
}
