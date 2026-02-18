import 'package:ppc_reto_recompensa/features/auth/domain/entities/respuesta.dart';

class RespuestaModel extends Respuesta {
  RespuestaModel({
    required super.esCorrecto,
    required super.mensaje,
  });

  factory RespuestaModel.fromJson(Map<String, dynamic> json) {
    return RespuestaModel(
      esCorrecto: json['esCorrecto'],
      mensaje: json['mensaje'],
    );
  }
}
