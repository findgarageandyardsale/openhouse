import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/features/explore/presentation/providers/state/filter_notifier.dart';
import 'package:open_house/features/explore/presentation/providers/state/filter_state.dart';
import 'package:open_house/shared/domain/models/open_house/open_house_model.dart';

final filterNotifierProvider =
    StateNotifierProvider<FilterNotifier, FilterState>((ref) {
      return FilterNotifier();
    });

final sliderRangeProvider = StateProvider<double>((ref) {
  return 15.0;
});

final catListProvider = StateProvider.autoDispose<List<Category>?>((ref) {
  return null;
});
