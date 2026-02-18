# RetoRecompensaFront
Prueba RetoRecompensa para Banco Sol


• Cómo correr frontend
========================
en lib/core/network/api_client.dart
configurar baseUrl al sitio y puerto del backend
 ApiClient()
      : dio = Dio(
          BaseOptions(
            baseUrl: 'http://localhost:5092',
            headers: {'Content-Type': 'application/json'},
          ),
        );