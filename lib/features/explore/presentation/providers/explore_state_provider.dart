import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/features/explore/presentation/providers/filter_state_provider.dart';
import 'package:open_house/shared/presentation/formz_state.dart';

import '../../../../services/location_service/presentation/map_notifier_provider.dart';
import '../../domain/providers/explore_providers.dart';
import 'state/explore_notifier.dart';
import 'state/explore_state.dart';

// final mapControllerState = StateProvider<GoogleMapController?>((ref) {
//   return null;
// });
final zoomLevelState = StateProvider<double>((ref) {
  return 15.0;
});

final exploreNotifierProvider =
    StateNotifierProvider.autoDispose<ExploreNotifier, ExploreState>((ref) {
  final repository = ref.read(exploreRepositoryProvider);
  final filterState = ref.watch(filterNotifierProvider);
  final userLocationState = ref.watch(mapNotifierProvider);

  return ExploreNotifier(repository, filterState, userLocationState)
    ..resetState()
    ..fetchExplorePosts();
});

final detailPageProvider = StateNotifierProvider.autoDispose
    .family<DetailPageNotifier, FormzState, int?>((ref, postId) {
  final repository = ref.read(exploreRepositoryProvider);
  return DetailPageNotifier(repository)..fetchPostDetails(postId);
});
