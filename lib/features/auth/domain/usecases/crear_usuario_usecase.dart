import 'package:ppc_reto_recompensa/features/auth/domain/entities/respuesta.dart';
import 'package:ppc_reto_recompensa/features/auth/domain/repositories/auth_repository.dart';

class CrearUsuarioUseCase {
  final AuthRepository repository;

  CrearUsuarioUseCase(this.repository);

  Future<Respuesta> call(
    String correo,
    String pass,
    String nombre,
    String avatar,
  ) {
    return repository.crearUsuario(
      correo,
      pass,
      nombre,
      avatar,
    );
  }
}
