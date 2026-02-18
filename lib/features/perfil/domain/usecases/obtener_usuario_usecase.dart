import 'package:ppc_reto_recompensa/features/auth/domain/entities/user.dart';
import 'package:ppc_reto_recompensa/features/perfil/domain/repositories/usuario_repository.dart';

class ObtenerUsuarioUseCase {
  final UsuarioRepository repository;

  ObtenerUsuarioUseCase(this.repository);

  Future<User> call(int userId) {
    return repository.obtener(userId);
  }
}
