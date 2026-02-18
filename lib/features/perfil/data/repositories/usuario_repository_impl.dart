import 'package:ppc_reto_recompensa/features/auth/domain/entities/user.dart';
import 'package:ppc_reto_recompensa/features/perfil/data/datasources/usuario_remote_datasource.dart';
import 'package:ppc_reto_recompensa/features/perfil/domain/repositories/usuario_repository.dart';

class UsuarioRepositoryImpl implements UsuarioRepository {
  final UsuarioRemoteDataSource remote;

  UsuarioRepositoryImpl(this.remote);

  @override
  Future<User> obtener(int userId) {
    return remote.obtener(userId);
  }

}
