import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ppc_reto_recompensa/core/errors/api_exception.dart';
import 'package:ppc_reto_recompensa/features/auth/presentation/controllers/auth_controller.dart';
import 'package:ppc_reto_recompensa/features/auth/presentation/widgets/login_form.dart';
import 'package:ppc_reto_recompensa/features/perfil/presentation/pages/perfil_page.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authControllerProvider, (previous, next) {
      next.whenOrNull(
        data: (user) {
          if (user != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => PerfilPage(userId: user.id)),
            );
          }
        },
        error: (e, _) {
          final message = e is ApiException
              ? e.message
              : 'Ocurrió un error inesperado';
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(message)));
        },
      );
    });

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: LoginForm(),
            ),
          ),
        ),
      ),
    );
  }
}
