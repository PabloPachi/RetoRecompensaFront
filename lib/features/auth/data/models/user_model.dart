import 'package:ppc_reto_recompensa/features/auth/domain/entities/user.dart';
import 'package:ppc_reto_recompensa/features/recompensas/data/models/recompensa_model.dart';
import 'package:ppc_reto_recompensa/features/retos/data/models/reto_model.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.nombre,
    required super.avatar,
    required super.correo,
    required super.puntos,
    required super.retosCompletados,
    required super.retosPendientes,
    required super.recompensasObtenidas,
    required super.recompensasDisponibles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      nombre: json['nombre'],
      avatar: json['avatar'] ?? '',
      correo: json['correo'],
      puntos: json['puntos'],
      retosCompletados: (json['retosCompletados'] as List)
          .map((e) => RetoModel.fromJson(e))
          .toList(),
      retosPendientes: (json['retosPendientes'] as List)
          .map((e) => RetoModel.fromJson(e))
          .toList(),
      recompensasObtenidas: (json['recompensasObtenidas'] as List)
          .map((e) => RecompensaModel.fromJson(e))
          .toList(),
      recompensasDisponibles: (json['recompensasDisponibles'] as List)
          .map((e) => RecompensaModel.fromJson(e))
          .toList(),
    );
  }
}
