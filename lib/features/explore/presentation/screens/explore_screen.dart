import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/features/explore/presentation/providers/explore_state_provider.dart';
import 'package:open_house/features/explore/presentation/providers/state/explore_state.dart';
import 'package:open_house/features/explore/presentation/providers/state/filter_state.dart';
import 'package:open_house/features/explore/presentation/screens/widget/filter_chip_widget.dart';
import 'package:open_house/features/explore/presentation/widgets/filter_drawer_widget.dart';

import '../../../../shared/constants/spacing.dart';
import '../../../../shared/core/custom_debouncer.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../authentication/presentation/widgets/auth_field.dart';
import '../providers/filter_state_provider.dart';
import '../widgets/slider_dialog_content.dart';
import 'list_explore.dart';
import 'map_explore.dart';

@RoutePage()
class ExploreScreen extends ConsumerStatefulWidget {
  const ExploreScreen({super.key});

  @override
  ConsumerState<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen> {
  final scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  bool listView = true;
  bool isSearchActive = false;
  bool isLoading = true;
  DateFilter? selectedDateFilter;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    scrollController.addListener(scrollControllerListener);

    listView = true;
    Future.delayed(const Duration(milliseconds: 500), () {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void scrollControllerListener() {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      final notifier = ref.read(exploreNotifierProvider.notifier);

      notifier.fetchExplorePosts(search: searchController.text);
    }
  }

  Future<void> _refreshPosts() async {
    final notifier = ref.read(exploreNotifierProvider.notifier);
    searchController.text = '';
    notifier
      ..resetState()
      ..fetchExplorePosts(
        search: searchController.text,
      ); // Assuming you have a refresh method
  }

  void refreshScrollControllerListener() {
    scrollController.removeListener(scrollControllerListener);
    scrollController.addListener(scrollControllerListener);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(exploreNotifierProvider);

    ref.watch(filterNotifierProvider);
    final debouncer = CustomDebouncer(milliseconds: 900);

    ref.listen(exploreNotifierProvider.select((value) => value), ((
      ExploreState? previous,
      ExploreState next,
    ) {
      //show Snackbar on failure
      if (next.state == ExploreConcreteState.fetchedAllExplore) {
        if (next.message.isNotEmpty &&
            !(next.message.toString().toLowerCase().contains('success'))) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(next.message.toString())));
        }
      }
    }));

    void searchAction() {
      ref.read(exploreNotifierProvider.notifier).resetFetchingStateToPage0();
      debouncer.run(() {
        ref
            .read(exploreNotifierProvider.notifier)
            .fetchExplorePosts(search: searchController.text);

        refreshScrollControllerListener();
      });
    }

    return Scaffold(
      // appBar: AppBar(title: const Text('Garage/Yard Sale')),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: listView
            ? AuthField(
                name: 'search',
                hintText: 'Search',
                controller: searchController,
                onChanged: (val) => searchAction(),
                suffixIcon: IconButton(
                  icon: Icon(
                    searchController.text.isEmpty ? Icons.search : Icons.close,
                    color: AppColors.black,
                  ),
                  onPressed: () {
                    if (searchController.text.isNotEmpty) {
                      searchController.clear();
                    }
                    searchAction();
                  },
                ),
                borderRadius: 30.0,
              )
            : null,
        // actions: listView
        //     ? [
        //         IconButton(
        //           onPressed: () {
        //             Scaffold.of(context).openEndDrawer();
        //           },
        //           icon: Icon(Icons.sort),
        //         ),
        //       ]
        //     : null,
      ),
      // endDrawer: const FilterDrawerWidget(),

      floatingActionButton: FloatingActionButton(
        heroTag: 'Explore',
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: () {
          setState(() {
            listView = !listView;
          });
        },
        child: Icon(listView ? Icons.map_outlined : Icons.list),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const FilterChipWidget(),
            ),
            // state.state == ExploreConcreteState.loading
            //     ? const Expanded(child: MainViewShimmer())
            //     : state.hasData
            //     ?
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refreshPosts,
                child: listView
                    ? ListExplore(scrollController: scrollController)
                    : const MapExplore(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSliderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: SliderDialogContent(),
          ),
        );
      },
    );
  }
}

class TextIconButtonWidget extends StatelessWidget {
  const TextIconButtonWidget({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: const Text('Clear Filter'),
      icon: const Icon(Icons.clear),
    );
  }
}
