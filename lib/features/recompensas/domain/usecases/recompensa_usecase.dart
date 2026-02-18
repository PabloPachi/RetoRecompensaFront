import 'package:ppc_reto_recompensa/features/recompensas/domain/repositories/recompensa_repository.dart';

class ReclamarRecompensaUseCase {
  final RecompensaRepository repository;

  ReclamarRecompensaUseCase(this.repository);

  Future<void> call(int idUsuario, int idRecompensa) {
    return repository.reclamarRecompensa(idUsuario, idRecompensa);
  }
}
