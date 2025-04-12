import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/features/add_edit_sale/presentation/provider/state/category_notifier.dart';
import 'package:open_house/shared/presentation/formz_state.dart';

import '../../domain/category_providers.dart';

final catNotifierProvider =
    StateNotifierProvider.autoDispose<CategoryNotifier, FormzState>((ref) {
      final repository = ref.read(categoryRepositoryProvider);
      return CategoryNotifier(repository)..fetchAllCatList();
    });
final addCatNotifierProvider =
    StateNotifierProvider.autoDispose<AddCategoryNotifier, FormzState>((ref) {
      final repository = ref.read(categoryRepositoryProvider);
      return AddCategoryNotifier(repository);
    });
