import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:ppc_reto_recompensa/core/network/api_client.dart';
import 'package:ppc_reto_recompensa/features/auth/domain/entities/user.dart';
import 'package:ppc_reto_recompensa/features/perfil/application/user_notifier.dart';
import 'package:ppc_reto_recompensa/features/perfil/data/datasources/usuario_remote_datasource.dart';
import 'package:ppc_reto_recompensa/features/perfil/data/datasources/usuario_remote_datasource_impl.dart';
import 'package:ppc_reto_recompensa/features/perfil/data/repositories/usuario_repository_impl.dart';
import 'package:ppc_reto_recompensa/features/perfil/domain/repositories/usuario_repository.dart';
import 'package:ppc_reto_recompensa/features/perfil/domain/usecases/obtener_usuario_usecase.dart';

final obtenerUsuarioUseCaseProvider = Provider<ObtenerUsuarioUseCase>((ref) {
  final repository = ref.read(usuarioRepositoryProvider);
  return ObtenerUsuarioUseCase(repository);
});
final usuarioRepositoryProvider = Provider<UsuarioRepository>((ref) {
  return UsuarioRepositoryImpl(ref.read(usuarioRemoteDataSourceProvider));
});
final usuarioRemoteDataSourceProvider =
    Provider<UsuarioRemoteDataSource>((ref) {
  return UsuarioRemoteDataSourceImpl(ref.read(dioProvider));
});
final dioProvider = Provider<Dio>((ref) {
  return ApiClient().dio;
});

final userProvider =
    StateNotifierProvider<UserNotifier, AsyncValue<User>>((ref) {
  return UserNotifier(
    ref.read(obtenerUsuarioUseCaseProvider),
  );
});
