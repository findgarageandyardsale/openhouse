import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/shared/domain/models/open_house/open_house.dart';

import 'state/add_data_notifier.dart';

final addDataNotifierProvider =
    StateNotifierProvider<AddDataNotifier, OpenHouse?>((ref) {
      return AddDataNotifier(ref)..addInitialTimeSlot();
    });

final loadingFilesProvider = StateProvider.autoDispose.family<bool, String>((
  ref,
  key,
) {
  return false; // Initial value for each unique key
});
