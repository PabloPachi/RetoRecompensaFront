import 'package:ppc_reto_recompensa/features/auth/data/models/respuesta_model.dart';
import 'package:ppc_reto_recompensa/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<RespuestaModel> crearUsuario(String correo, String pass, String nombre, String avatar);
}