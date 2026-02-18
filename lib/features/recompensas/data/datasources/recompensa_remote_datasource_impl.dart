import 'package:dio/dio.dart';
import 'package:ppc_reto_recompensa/features/recompensas/data/datasources/recompensa_remote_datasource.dart';

class RecompensaRemoteDataSourceImpl
    implements RecompensaRemoteDataSource {
  final Dio dio;

  RecompensaRemoteDataSourceImpl(this.dio);

  @override
  Future<void> reclamarRecompensa({
    required int idUsuario,
    required int idRecompensa,
  }) async {
    await dio.post(
      '/api/Recompensa/Obtener',
      data: {
        'idUsuario': idUsuario,
        'idRecompensa': idRecompensa,
      },
    );
  }
}

