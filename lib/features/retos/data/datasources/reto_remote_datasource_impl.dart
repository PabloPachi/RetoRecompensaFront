import 'package:dio/dio.dart';
import 'package:ppc_reto_recompensa/features/retos/data/datasources/reto_remote_datasource.dart';

class RetoRemoteDataSourceImpl implements RetoRemoteDataSource {
  final Dio dio;

  RetoRemoteDataSourceImpl(this.dio);

  @override
  Future<void> completarReto(int idUsuario, int idReto) async {
    await dio.post(
      '/api/Reto/Completar',
      data: {
        'idUsuario': idUsuario,
        'idReto': idReto,
      },
    );
  }
}
