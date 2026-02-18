import 'package:ppc_reto_recompensa/features/auth/domain/entities/user.dart';

abstract class UsuarioRepository {
  Future<User> obtener(int userId);
}