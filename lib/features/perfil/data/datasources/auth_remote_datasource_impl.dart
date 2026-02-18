import 'package:dio/dio.dart';
import 'package:ppc_reto_recompensa/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ppc_reto_recompensa/features/auth/data/models/respuesta_model.dart';
import 'package:ppc_reto_recompensa/features/auth/data/models/user_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<UserModel> login(String correo, String password) async {
    final response = await dio.post(
      '/api/Usuario/Acceder',
      data: {'correo': correo, 'pass': password},
    );

    return UserModel.fromJson(response.data);
  }

  @override
  Future<RespuestaModel> crearUsuario(
    String correo,
    String pass,
    String nombre,
    String avatar,
  ) async {
    final response = await dio.post(
      '/api/Usuario/CrearUsuario',
      data: {
        'correo': correo,
        'pass': pass,
        'nombre': nombre,
        'avatar': avatar,
      },
    );

    return RespuestaModel.fromJson(response.data);
  }
}
