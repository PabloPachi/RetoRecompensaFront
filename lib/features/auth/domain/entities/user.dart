import 'package:ppc_reto_recompensa/features/recompensas/domain/entities/recompensa.dart';
import 'package:ppc_reto_recompensa/features/retos/domain/entities/reto.dart';

class User {
  final int id;
  final String nombre;
  final String avatar;
  final String correo;
  final int puntos;

  final List<Reto> retosCompletados;
  final List<Reto> retosPendientes;
  final List<Recompensa> recompensasObtenidas;
  final List<Recompensa> recompensasDisponibles;

  User({
    required this.id,
    required this.nombre,
    required this.avatar,
    required this.correo,
    required this.puntos,
    required this.retosCompletados,
    required this.retosPendientes,
    required this.recompensasObtenidas,
    required this.recompensasDisponibles,
  });
}