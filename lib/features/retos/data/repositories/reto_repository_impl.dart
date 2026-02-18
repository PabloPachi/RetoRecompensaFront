import 'package:ppc_reto_recompensa/features/retos/data/datasources/reto_remote_datasource.dart';
import 'package:ppc_reto_recompensa/features/retos/data/repositories/reto_repository.dart';

class RetoRepositoryImpl implements RetoRepository {
  final RetoRemoteDataSource remote;

  RetoRepositoryImpl(this.remote);

  @override
  Future<void> completarReto(int idUsuario, int idReto) {
    return remote.completarReto(idUsuario, idReto);
  }
}
