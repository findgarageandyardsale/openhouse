// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/features/explore/presentation/providers/filter_state_provider.dart';
import 'package:open_house/features/explore/presentation/widgets/filter_drawer_widget.dart';
import 'package:open_house/routes/app_route.gr.dart';
import 'package:open_house/services/location_service/presentation/map_notifier_provider.dart';
import 'package:open_house/shared/core/app_context.dart';
import 'package:open_house/shared/theme/app_colors.dart';
// import 'package:update_available/update_available.dart';
import '../../../../services/user_cache_service/domain/providers/current_user_provider.dart';
import '../../../../shared/domain/models/user/user_model.dart';

@RoutePage()
class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  final scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  int currentPageIndex = 0;

  // void printAvailability() async {
  //   try {
  //     final updateAvailability = await getUpdateAvailability();
  //     switch (updateAvailability) {
  //       case UpdateAvailable():
  //         showDialog(
  //           context: context,
  //           barrierDismissible: false,
  //           builder: (BuildContext context) {
  //             return const AppUpdateDialogBody();
  //           },
  //         );
  //         break;
  //       case NoUpdateAvailable():
  //         break;
  //       case UnknownAvailability():
  //         break;
  //     }
  //   } catch (e) {
  //     // Handle the error appropriately
  //     PrintUtils.customLog('Error: $e');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    Future.wait([ref.read(mapNotifierProvider.notifier).getUserLocation()]);
    Future.microtask(() {
      ref.read(filterNotifierProvider.notifier).updateToInitial();

      // printAvailability();
    });
  }

  @override
  Widget build(BuildContext context) {
    AppContext.setContext(context);
    final currentUserAsyncValue = ref.watch(currentUserProvider);

    return AutoTabsRouter(
      // list of your tab routes
      // routes used here must be declared as children
      routes: const [ExploreScreen(), SalesScreen(), AccountScreen()],
      transitionBuilder:
          (context, child, animation) => FadeTransition(
            opacity: animation,
            // the passed child is technically our animated selected-tab page
            child: child,
          ),
      builder: (context, child) {
        // obtain the scoped TabsRouter controller using context
        final tabsRouter = AutoTabsRouter.of(context);
        // Here we're building our Scaffold inside of AutoTabsRouter
        // to access the tabsRouter controller provided in this context
        //
        // alternatively, you could use a global key
        return Scaffold(
          body: child,
          endDrawer: const FilterDrawerWidget(),

          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: Colors.blue.withOpacity(0.2),
              labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
                states,
              ) {
                if (states.contains(WidgetState.selected)) {
                  return const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  );
                }
                return const TextStyle(
                  color: AppColors.unselectedTextColor,
                  fontWeight: FontWeight.w700,
                );
              }),
            ),
            child: NavigationBar(
              backgroundColor: AppColors.surfaceLight,
              onDestinationSelected: (int index) {
                currentUserAsyncValue.when(
                  data: (User? data) {
                    if (data == null && index == 1) {
                      context.router.push(LoginScreen());
                      return;
                    } else {
                      if (index == 0) {
                        //reset data
                        ref
                            .read(filterNotifierProvider.notifier)
                            .updateToInitial();
                      }
                      tabsRouter.setActiveIndex(index);
                    }
                  },
                  error: (Object error, StackTrace stackTrace) {},
                  loading: () {},
                );
              },
              selectedIndex: tabsRouter.activeIndex,
              destinations: const [
                NavigationDestination(
                  selectedIcon: Icon(Icons.search, color: AppColors.primary),
                  icon: Icon(
                    Icons.search,
                    color: AppColors.unselectedTextColor,
                  ),
                  label: 'Explore',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.list, color: AppColors.primary),
                  icon: Icon(
                    Icons.attach_money,
                    color: AppColors.unselectedTextColor,
                  ),
                  label: 'My list',
                ),
                NavigationDestination(
                  selectedIcon: Icon(
                    Icons.person_outline,
                    color: AppColors.primary,
                  ),
                  icon: Icon(
                    Icons.person_outline,
                    color: AppColors.unselectedTextColor,
                  ),
                  label: 'Account',
                ),
              ],
              indicatorColor: AppColors.primaryContainer,
            ),
          ),
        );
      },
    );
  }
}
