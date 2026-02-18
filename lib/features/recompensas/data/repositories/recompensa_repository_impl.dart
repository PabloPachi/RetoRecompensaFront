import 'package:ppc_reto_recompensa/features/recompensas/data/datasources/recompensa_remote_datasource.dart';
import 'package:ppc_reto_recompensa/features/recompensas/domain/repositories/recompensa_repository.dart';

class RecompensaRepositoryImpl implements RecompensaRepository {
  final RecompensaRemoteDataSource remote;

  RecompensaRepositoryImpl(this.remote);

  @override
  Future<void> reclamarRecompensa(
      int idUsuario, int idRecompensa) {
    return remote.reclamarRecompensa(
      idUsuario: idUsuario,
      idRecompensa: idRecompensa,
    );
  }
}
