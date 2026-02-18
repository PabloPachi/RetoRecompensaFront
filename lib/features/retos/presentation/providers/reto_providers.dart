import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppc_reto_recompensa/core/network/api_client.dart';
import 'package:ppc_reto_recompensa/features/retos/data/datasources/reto_remote_datasource.dart';
import 'package:ppc_reto_recompensa/features/retos/data/datasources/reto_remote_datasource_impl.dart';
import 'package:ppc_reto_recompensa/features/retos/data/repositories/reto_repository.dart';
import 'package:ppc_reto_recompensa/features/retos/data/repositories/reto_repository_impl.dart';
import 'package:ppc_reto_recompensa/features/retos/domain/usecases/completar_reto_usecase.dart';

final dioProvider = Provider<Dio>((ref) {
  return ApiClient().dio;
});
final retoRemoteDataSourceProvider =
    Provider<RetoRemoteDataSource>((ref) {
  return RetoRemoteDataSourceImpl(ref.read(dioProvider));
});
final retoRepositoryProvider = Provider<RetoRepository>((ref) {
  return RetoRepositoryImpl(ref.read(retoRemoteDataSourceProvider));
});
final completarRetoUseCaseProvider =
    Provider<CompletarRetoUseCase>((ref) {
  return CompletarRetoUseCase(ref.read(retoRepositoryProvider));
});
