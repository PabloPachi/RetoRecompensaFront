import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppc_reto_recompensa/features/auth/domain/entities/user.dart';
import 'package:ppc_reto_recompensa/features/auth/presentation/pages/login_page.dart';
import 'package:ppc_reto_recompensa/features/perfil/presentation/providers/user_providers.dart';
import 'package:ppc_reto_recompensa/features/recompensas/domain/entities/recompensa.dart';
import 'package:ppc_reto_recompensa/features/recompensas/presentation/providers/recompensa_providers.dart';
import 'package:ppc_reto_recompensa/features/retos/presentation/pages/reto_detalle_page.dart';

class PerfilPage extends ConsumerStatefulWidget {
  final int userId;

  const PerfilPage({super.key, required this.userId});

  @override
  ConsumerState<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends ConsumerState<PerfilPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(userProvider.notifier).cargar(widget.userId);
    });
  }

  void _logout(BuildContext context) {
    ref.invalidate(userProvider);

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Cerrar sesión',
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: userState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (user) => _PerfilContenido(user: user),
      ),
    );
  }
}

class _PerfilContenido extends ConsumerWidget {
  final User user;

  const _PerfilContenido({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Bienvenido, ${user.nombre}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // 🔹 Info general
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: user.avatar.isNotEmpty
                      ? NetworkImage(user.avatar)
                      : null,
                  child: user.avatar.isEmpty ? const Icon(Icons.person) : null,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.nombre,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(user.correo),
                    Text('Puntos: ${user.puntos}'),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 32),

            // 🔹 Retos completados
            Text(
              'Retos completados',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            ...user.retosCompletados.map(
              (reto) => Card(
                child: ListTile(
                  leading: const Icon(Icons.check_circle, color: Colors.green),
                  title: Text(reto.nombre),
                  subtitle: Text(reto.descripcion),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // 🔹 Recompensas obtenidas
            Text(
              'Recompensas obtenidas',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            ...user.recompensasObtenidas.map(
              (Recompensa r) => Card(
                color: Colors.green.shade50,
                child: ListTile(
                  leading: const Icon(Icons.emoji_events, color: Colors.green),
                  title: Text(r.nombre),
                  subtitle: Text(r.descripcion),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // 🔹 Retos pendientes
            Text(
              'Retos pendientes',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            ...user.retosPendientes.map(
              (reto) => Card(
                child: ListTile(
                  leading: const Icon(Icons.flag),
                  title: Text(reto.nombre),
                  subtitle: Text(reto.descripcion),
                  trailing: ElevatedButton(
                    child: const Text('Iniciar'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              RetoDetallePage(reto: reto, userId: user.id),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // 🔹 Recompensas disponibles
            Text(
              'Recompensas disponibles',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            ...user.recompensasDisponibles.map(
              (Recompensa r) => Card(
                child: ListTile(
                  leading: Icon(
                    Icons.card_giftcard,
                    color: r.habilitado == true ? Colors.blue : Colors.grey,
                  ),
                  title: Text(r.nombre),
                  subtitle: Text(r.descripcion),
                  trailing: r.habilitado == true
                      ? ElevatedButton(
                          onPressed: () async {
                            await ref.read(reclamarRecompensaUseCaseProvider)(
                              user.id,
                              r.id,
                            );
                            await ref
                                .read(userProvider.notifier)
                                .cargar(user.id);
                          },
                          child: const Text('Reclamar recompensa'),
                        )
                      : const Text('Bloqueada'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
