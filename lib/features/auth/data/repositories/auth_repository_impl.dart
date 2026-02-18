import 'package:ppc_reto_recompensa/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ppc_reto_recompensa/features/auth/domain/entities/respuesta.dart';
import 'package:ppc_reto_recompensa/features/auth/domain/entities/user.dart';
import 'package:ppc_reto_recompensa/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<User> login(String email, String password) {
    return remote.login(email, password);
  }

  @override
  Future<Respuesta> crearUsuario(String correo, String pass, String nombre, String avatar) {
    return remote.crearUsuario(correo, pass, nombre, avatar);
  }
}
