// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/configs/flavors.dart';
import 'package:open_house/services/location_service/presentation/map_notifier_provider.dart';
import 'package:open_house/shared/utils/permission_utils.dart';
import 'package:open_house/shared/utils/print_utils.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../routes/app_route.dart';
import '../../../../routes/app_route.gr.dart';
import '../../../../shared/widgets/custom_toast.dart';
import '../providers/splash_provider.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  final AppRouter appRouter = AppRouter();

  Future<void> _handlePermissions() async {
    try {
      await Permission.appTrackingTransparency.request();

      bool isGranted = await PermissionUtils().isLocationPermissionGranted();
      if (!isGranted) {
        bool permissionRequested =
            await PermissionUtils().requestLocationPermission();
        if (!permissionRequested) {
          if (await PermissionUtils().isLocationPermissionDeniedPermanently()) {
            CustomToast.showToast(
              "Location permission is required. Please enable it in settings.",
              status: ToastStatus.error,
            );
          }
        }
      }
    } catch (e) {
      PrintUtils.customLog('catch error $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _handlePermissions();
    Future.microtask(() {
      ref.read(mapNotifierProvider.notifier).getUserLocation();
    });

    Future.delayed(const Duration(milliseconds: 900), () async {
      try {
        final isUserLoggedIn = await ref.read(userLoginCheckProvider.future);
        final route = isUserLoggedIn
            ? const DashboardScreen()
            : const CustomIntroScreen() as PageRouteInfo;
        AutoRouter.of(context).pushAndPopUntil(route, predicate: (_) => false);
      } catch (e) {
        PrintUtils.customLog('catch error $e');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Image.asset(FlavorValue.appIcon ?? 'assets/launcher.png',
            height: 150, width: 150),
      ),
    );
  }
}
