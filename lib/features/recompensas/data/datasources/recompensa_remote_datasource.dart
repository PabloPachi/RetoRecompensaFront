abstract class RecompensaRemoteDataSource {
  Future<void> reclamarRecompensa({
    required int idUsuario,
    required int idRecompensa,
  });
}