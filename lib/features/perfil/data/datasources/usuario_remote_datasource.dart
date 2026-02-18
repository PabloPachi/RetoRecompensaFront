import 'package:ppc_reto_recompensa/features/auth/data/models/user_model.dart';

abstract class UsuarioRemoteDataSource {
  Future<UserModel> obtener(int userId);
}