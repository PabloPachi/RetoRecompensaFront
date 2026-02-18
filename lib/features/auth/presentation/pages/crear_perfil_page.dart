import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppc_reto_recompensa/features/auth/presentation/providers/auth_providers.dart';

class CrearPerfilPage extends ConsumerStatefulWidget {
  const CrearPerfilPage({super.key});

  @override
  ConsumerState<CrearPerfilPage> createState() => _CrearPerfilPageState();
}

class _CrearPerfilPageState extends ConsumerState<CrearPerfilPage> {
  final _correoCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _nombreCtrl = TextEditingController();

  String? _avatarSeleccionado;

  final avatars = [
    'https://i.pravatar.cc/150?img=1',
    'https://i.pravatar.cc/150?img=2',
    'https://i.pravatar.cc/150?img=3',
    'https://i.pravatar.cc/150?img=4',
    'https://i.pravatar.cc/150?img=5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear perfil')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: _correoCtrl,
              decoration: const InputDecoration(labelText: 'Correo'),
            ),
            TextField(
              controller: _passCtrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Contraseña'),
            ),
            TextField(
              controller: _nombreCtrl,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),

            const SizedBox(height: 16),

            const Text('Selecciona un avatar'),
            const SizedBox(height: 8),

            Wrap(
              spacing: 12,
              children: avatars.map((url) {
                final seleccionado = _avatarSeleccionado == url;

                return GestureDetector(
                  onTap: () {
                    setState(() => _avatarSeleccionado = url);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage(url),
                      ),

                      if (seleccionado)
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.35),
                            shape: BoxShape.circle,
                          ),
                        ),

                      if (seleccionado)
                        const Icon(
                          Icons.check_circle,
                          color: Colors.white,
                          size: 32,
                        ),
                    ],
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: _avatarSeleccionado == null
                  ? null
                  : () async {
                      await ref.read(crearUsuarioUseCaseProvider)(
                        _correoCtrl.text,
                        _passCtrl.text,
                        _nombreCtrl.text,
                        _avatarSeleccionado!,
                      );

                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
              child: const Text('Crear perfil'),
            ),
          ],
        ),
      ),
    );
  }
}
