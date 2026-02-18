import 'package:dio/dio.dart';
import 'package:ppc_reto_recompensa/features/auth/data/models/user_model.dart';
import 'package:ppc_reto_recompensa/features/perfil/data/datasources/usuario_remote_datasource.dart';

class UsuarioRemoteDataSourceImpl implements UsuarioRemoteDataSource {
  final Dio dio;

  UsuarioRemoteDataSourceImpl(this.dio);

  @override
  Future<UserModel> obtener(int userId) async {
    final response = await dio.post(
      '/api/Usuario/Obtener',
      data: {'idUsuario': userId},
    );

    return UserModel.fromJson(response.data);
  }

}
