import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:ppc_reto_recompensa/features/auth/domain/entities/user.dart';
import 'package:ppc_reto_recompensa/features/auth/domain/usecases/login_usecase.dart';
import 'package:ppc_reto_recompensa/features/auth/presentation/providers/auth_providers.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<User?>>(
  (ref) {
    final useCase = ref.read(loginUseCaseProvider);
    return AuthController(useCase);
  },
);

class AuthController extends StateNotifier<AsyncValue<User?>> {
  final LoginUseCase loginUseCase;

  AuthController(this.loginUseCase) : super(const AsyncData(null));

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    try {
      final user = await loginUseCase(email, password);
      state = AsyncData(user);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
