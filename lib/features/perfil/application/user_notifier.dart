import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:ppc_reto_recompensa/features/auth/domain/entities/user.dart';
import 'package:ppc_reto_recompensa/features/perfil/domain/usecases/obtener_usuario_usecase.dart';

class UserNotifier extends StateNotifier<AsyncValue<User>> {
  final ObtenerUsuarioUseCase _useCase;

  UserNotifier(this._useCase) : super(const AsyncLoading());

  Future<void> cargar(int userId) async {
    state = const AsyncLoading();
    try {
      final user = await _useCase(userId);
      state = AsyncData(user);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
