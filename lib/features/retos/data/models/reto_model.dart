import 'package:ppc_reto_recompensa/features/retos/domain/entities/reto.dart';

class RetoModel extends Reto {
  RetoModel({
    required super.id,
    required super.nombre,
    required super.descripcion,
  });

  factory RetoModel.fromJson(Map<String, dynamic> json) {
    return RetoModel(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
    );
  }
}