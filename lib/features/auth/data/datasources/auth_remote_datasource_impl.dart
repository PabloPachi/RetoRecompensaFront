import 'package:dio/dio.dart';
import 'package:ppc_reto_recompensa/core/errors/api_exception.dart';
import 'package:ppc_reto_recompensa/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ppc_reto_recompensa/features/auth/data/models/respuesta_model.dart';
import 'package:ppc_reto_recompensa/features/auth/data/models/user_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<UserModel> login(String correo, String password) async {
    try {
      final response = await dio.post(
        '/api/Usuario/Acceder',
        data: {'correo': correo, 'pass': password},
      );

      final data = response.data;

      if (data['esCorrecto'] == false) {
        throw ApiException(data['mensaje']);
      }

      return UserModel.fromJson(data);
    } on DioException catch (e) {
      final data = e.response?.data;
      final mensaje = data is Map && data['mensaje'] != null
          ? data['mensaje']
          : 'Error de conexión';

      throw ApiException(mensaje);
    }
  }

  Future<RespuestaModel> crearUsuario(
    String correo,
    String pass,
    String nombre,
    String avatar,
  ) async {
    try {
      final response = await dio.post(
        '/api/Usuario/CrearUsuario',
        data: {
          'correo': correo,
          'pass': pass,
          'nombre': nombre,
          'avatar': avatar,
        },
      );
      final data = response.data;

      if (data['esCorrecto'] == false) {
        throw ApiException(data['mensaje']);
      }
      return RespuestaModel.fromJson(data);
    } on DioException catch (e) {
      final data = e.response?.data;
      final mensaje = data is Map && data['mensaje'] != null
          ? data['mensaje']
          : 'Error de conexión';

      throw ApiException(mensaje);
    }
  }
}
