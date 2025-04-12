import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/features/account/domain/providers/account_provider.dart';
import 'package:open_house/features/account/domain/repository/account_repository.dart';
import 'package:open_house/services/user_cache_service/domain/providers/current_user_provider.dart';
import 'package:open_house/services/user_cache_service/domain/providers/user_cache_provider.dart';
import 'package:open_house/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:open_house/shared/domain/models/user/user_model.dart';
import 'package:open_house/shared/exceptions/http_exception.dart';
import 'package:open_house/shared/presentation/formz_state.dart';
import 'package:open_house/shared/utils/print_utils.dart';

/// [Used For get profile provider]
final getProfileNotifierProvider =
    StateNotifierProvider<GetProfileProvider, FormzState>((ref) {
      final AccountRepository accRepo = ref.read(accountRepositoryProvider);
      final UserRepository userRepository = ref.read(
        userLocalRepositoryProvider,
      );

      return GetProfileProvider(
        userAccountRepository: accRepo,
        userRepository: userRepository,
        ref: ref,
      );
    });

class GetProfileProvider extends StateNotifier<FormzState> {
  final AccountRepository userAccountRepository;
  final UserRepository userRepository;
  Ref ref;
  GetProfileProvider({
    required this.userAccountRepository,
    required this.userRepository,
    required this.ref,
  }) : super(const FormzState.initial());
  initState() {
    state = const FormzState.initial();
  }

  Future<void> getProfile() async {
    state = const FormzState.loading();
    final response = await userAccountRepository.getProfile();

    state = await response.fold((failure) => FormzState.failure(failure), (
      response,
    ) async {
      try {
        final previousUser = ref.read(currentUserProvider).value;
        final responseData = response.data;
        User user = User.fromJson(responseData['data'] ?? responseData.data);
        if ((user.token ?? '').isEmpty) {
          user = user.copyWith(token: previousUser?.token);
        }
        final hasSavedUser = await userRepository.saveUser(user: user);
        if (hasSavedUser) {
          ref.invalidate(currentUserProvider);
          return const FormzState.initial();
        }
      } catch (e) {
        PrintUtils.customLog(e.toString());
      }
      return FormzState.failure(CacheFailureException());
    });
  }
}

/*

 
*/
