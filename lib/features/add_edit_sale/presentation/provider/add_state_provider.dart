import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/features/add_edit_sale/data/repositories/add_repository.dart';
import 'package:open_house/shared/presentation/formz_state.dart';

import '../../domain/add_provider.dart';
import 'add_data_provider.dart';
import 'state/add_notifier.dart';

final addNotifierProvider = StateNotifierProvider<AddNotifier, FormzState>((
  ref,
) {
  final AddRepository addRepository = ref.read(addRepositoryProvider);
  final data = ref.watch(addDataNotifierProvider);
  return AddNotifier(ref: ref, addRepository: addRepository, postData: data);
});
