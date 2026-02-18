class Recompensa {
  final int id;
  final String nombre;
  final String descripcion;
  final bool? habilitado;

  Recompensa({
    required this.id,
    required this.nombre,
    required this.descripcion,
    this.habilitado,
  });
}
