import 'package:ppc_reto_recompensa/features/recompensas/domain/entities/recompensa.dart';

class RecompensaModel extends Recompensa {
  RecompensaModel({
    required super.id,
    required super.nombre,
    required super.descripcion,
    super.habilitado,
  });

  factory RecompensaModel.fromJson(Map<String, dynamic> json) {
    return RecompensaModel(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      habilitado: json['habilitado'],
    );
  }
}