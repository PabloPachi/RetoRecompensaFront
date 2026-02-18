import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppc_reto_recompensa/core/network/api_client.dart';
import 'package:ppc_reto_recompensa/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ppc_reto_recompensa/features/auth/data/datasources/auth_remote_datasource_impl.dart';
import 'package:ppc_reto_recompensa/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ppc_reto_recompensa/features/auth/domain/repositories/auth_repository.dart';
import 'package:ppc_reto_recompensa/features/auth/domain/usecases/crear_usuario_usecase.dart';
import 'package:ppc_reto_recompensa/features/auth/domain/usecases/login_usecase.dart';

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return LoginUseCase(repository);
});

final dioProvider = Provider<Dio>((ref) {
  return ApiClient().dio;
});

final authRemoteDataSourceProvider =
    Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(ref.read(dioProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.read(authRemoteDataSourceProvider));
});

final crearUsuarioUseCaseProvider =
    Provider<CrearUsuarioUseCase>((ref) {
  return CrearUsuarioUseCase(
    ref.read(authRepositoryProvider),
  );
});