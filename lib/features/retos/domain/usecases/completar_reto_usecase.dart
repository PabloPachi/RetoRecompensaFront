import 'package:ppc_reto_recompensa/features/retos/data/repositories/reto_repository.dart';

class CompletarRetoUseCase {
  final RetoRepository repository;

  CompletarRetoUseCase(this.repository);

  Future<void> call(int idUsuario, int idReto) {
    return repository.completarReto(idUsuario, idReto);
  }
}
