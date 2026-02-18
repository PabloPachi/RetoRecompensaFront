import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppc_reto_recompensa/features/perfil/presentation/providers/user_providers.dart';
import 'package:ppc_reto_recompensa/features/retos/domain/entities/reto.dart';
import 'package:ppc_reto_recompensa/features/retos/presentation/providers/reto_providers.dart';

class RetoDetallePage extends ConsumerStatefulWidget {
  final Reto reto;
  final int userId;

  const RetoDetallePage({super.key, required this.reto, required this.userId});

  @override
  ConsumerState<RetoDetallePage> createState() => _RetoDetallePageState();
}

class _RetoDetallePageState extends ConsumerState<RetoDetallePage> {
  final TextEditingController _textController = TextEditingController();
  bool botonPresionado = false;
  bool checkboxSeleccionado = false;

  bool get puedeCompletar {
    switch (widget.reto.id) {
      case 1:
        return botonPresionado;
      case 2:
        return _textController.text.isNotEmpty;
      case 3:
        return checkboxSeleccionado;
      case 4:
        return botonPresionado && _textController.text.isNotEmpty;
      case 5:
        return botonPresionado && checkboxSeleccionado;
      case 6:
        return _textController.text.isNotEmpty && checkboxSeleccionado;
      case 7:
        return botonPresionado &&
            _textController.text.isNotEmpty &&
            checkboxSeleccionado;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.reto.nombre)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.reto.descripcion),
            const SizedBox(height: 24),

            ..._buildRetoUI(widget.reto.id),

            const Spacer(),

            ElevatedButton(
              onPressed: puedeCompletar ? _completarReto : null,
              child: const Text('Completar reto'),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildRetoUI(int id) {
    switch (id) {
      case 1:
        return [_boton()];
      case 2:
        return [_inputTexto()];
      case 3:
        return [_checkbox()];
      case 4:
        return [_boton(), _inputTexto()];
      case 5:
        return [_boton(), _checkbox()];
      case 6:
        return [_inputTexto(), _checkbox()];
      case 7:
        return [_boton(), _inputTexto(), _checkbox()];
      default:
        return [const Text('Reto no soportado')];
    }
  }

  // 🔹 Componentes reutilizables
  Widget _boton() => ElevatedButton(
    onPressed: () {
      setState(() => botonPresionado = true);
    },
    child: const Text('Presionar'),
  );

  Widget _inputTexto() => TextField(
    controller: _textController,
    decoration: const InputDecoration(labelText: 'Ingrese una palabra'),
    onChanged: (_) => setState(() {}),
  );

  Widget _checkbox() => CheckboxListTile(
    title: const Text('Seleccionar opción'),
    value: checkboxSeleccionado,
    onChanged: (value) {
      setState(() => checkboxSeleccionado = value ?? false);
    },
  );

  void _completarReto() async {

    await ref.read(completarRetoUseCaseProvider)(widget.userId, widget.reto.id);
    await ref.read(userProvider.notifier).cargar(widget.userId);
    if (mounted) {
      Navigator.pop(context, true); // vuelve al dashboard
    }
  }
}
