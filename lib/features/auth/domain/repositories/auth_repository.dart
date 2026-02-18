import 'package:ppc_reto_recompensa/features/auth/domain/entities/respuesta.dart';
import 'package:ppc_reto_recompensa/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<Respuesta> crearUsuario(String correo, String pass, String nombre, String avatar);
}
