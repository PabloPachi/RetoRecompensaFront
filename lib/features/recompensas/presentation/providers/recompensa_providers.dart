import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppc_reto_recompensa/core/network/api_client.dart';
import 'package:ppc_reto_recompensa/features/recompensas/data/datasources/recompensa_remote_datasource.dart';
import 'package:ppc_reto_recompensa/features/recompensas/data/datasources/recompensa_remote_datasource_impl.dart';
import 'package:ppc_reto_recompensa/features/recompensas/data/repositories/recompensa_repository_impl.dart';
import 'package:ppc_reto_recompensa/features/recompensas/domain/repositories/recompensa_repository.dart';
import 'package:ppc_reto_recompensa/features/recompensas/domain/usecases/recompensa_usecase.dart';

final dioProvider = Provider<Dio>((ref) {
  return ApiClient().dio;
});
final recompensaDataSourceProvider =
    Provider<RecompensaRemoteDataSource>((ref) {
  return RecompensaRemoteDataSourceImpl(ref.read(dioProvider));
});
final recompensaRepositoryProvider = Provider<RecompensaRepository>((ref) {
  return RecompensaRepositoryImpl(ref.read(recompensaDataSourceProvider));
});
final reclamarRecompensaUseCaseProvider =
    Provider<ReclamarRecompensaUseCase>((ref) {
  return ReclamarRecompensaUseCase(
    ref.read(recompensaRepositoryProvider),
  );
});
