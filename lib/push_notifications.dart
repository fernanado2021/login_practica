import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotificationService {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  static Future<void> initialize() async {
    // 1. Solicitar permisos (especialmente importante en iOS y Android 13+)
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('Usuario otorgó permiso para notificaciones');
    } else {
      debugPrint('Usuario rechazó o no aceptó permisos');
    }

    // 2. Obtener el token del dispositivo (útil para enviar notificaciones directas)
    String? token = await _firebaseMessaging.getToken();
    debugPrint("Device Token: $token");

    // 3. Configurar listeners para diferentes estados

    // Foreground: Cuando la app está abierta y visible
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint(
          'Mensaje recibido en primer plano: ${message.notification?.title}');
      // Aquí se podría mostrar un diálogo o snackbar personalizado
    });

    // Background: Cuando el usuario hace clic en la notificación y la app estaba en segundo plano
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint(
          'El usuario abrió la app desde una notificación: ${message.notification?.title}');
    });

    // Terminated: Manejar el mensaje que abrió la app si estaba cerrada
    RemoteMessage? initialMessage =
        await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      debugPrint(
          'La app se inició desde una notificación: ${initialMessage.notification?.title}');
    }
  }

  // Listener para mostrar un diálogo cuando llega una notificación en primer plano
  static void setOnMessageListener(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(message.notification!.title ?? 'Notificación'),
            content:
                Text(message.notification!.body ?? 'Tienes un nuevo mensaje'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cerrar'),
              ),
            ],
          ),
        );
      }
    });
  }
}
