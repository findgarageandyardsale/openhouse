import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/repositories/auth_repository.dart';
import 'auth_state.dart';

class SignupNotifier extends StateNotifier<AuthState> {
  final AuthenticationRepository authRepository;

  SignupNotifier({required this.authRepository})
    : super(const AuthState.initial());

  Future<void> signup(Map<String, dynamic> user) async {
    state = const AuthState.loading();
    final response = await authRepository.signupUser(user: user);

    state = await response.fold((failure) => AuthState.failure(failure), (
      user,
    ) async {
      return const AuthState.success();
    });
  }
}
