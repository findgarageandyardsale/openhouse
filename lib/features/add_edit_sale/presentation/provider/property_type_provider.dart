import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/features/add_edit_sale/data/repositories/get_property_type_repository.dart';
import 'package:open_house/features/add_edit_sale/domain/property_type_providers.dart';
import 'package:open_house/shared/presentation/formz_state.dart';

final propertyTypeNotifierProvider =
    StateNotifierProvider.autoDispose<PropertTypeNotifier, FormzState>((ref) {
      final repository = ref.read(propertyTypeRepositoryProvider);
      return PropertTypeNotifier(repository)..fetchAllList();
    });

class PropertTypeNotifier extends StateNotifier<FormzState> {
  final GetPropertyTypeRepository catRepository;

  PropertTypeNotifier(this.catRepository) : super(const FormzState.initial());

  Future<void> fetchAllList() async {
    state = const FormzState.loading();

    final response = await catRepository.getPopertyTypeList();
    //  Check if the notifier is still mounted before updating the state
    if (mounted) {
      state = response.fold(
        (l) => FormzState.failure(l),
        (r) => FormzState.success(data: r.data),
      );
    }
  }

  void resetState() {
    state = const FormzState.initial();
  }
}

final addPropertyTypeNotifierProvider =
    StateNotifierProvider.autoDispose<AddProptyTypeNotifier, FormzState>((ref) {
      final repository = ref.read(propertyTypeRepositoryProvider);
      return AddProptyTypeNotifier(repository);
    });

class AddProptyTypeNotifier extends StateNotifier<FormzState> {
  final GetPropertyTypeRepository catRepository;

  AddProptyTypeNotifier(this.catRepository) : super(const FormzState.initial());

  Future<void> addType(String catName) async {
    state = const FormzState.loading();

    final response = await catRepository.addPropertyType(catName);
    //  Check if the notifier is still mounted before updating the state
    if (mounted) {
      state = response.fold((l) => FormzState.failure(l), (r) {
        return FormzState.success(data: r.data);
      });
    }
  }

  void resetState() {
    state = const FormzState.initial();
  }
}
