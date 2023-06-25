import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/services/api/api.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:health_safe_paciente/src/services/push_notifications/push_notification_service.dart';
import 'package:health_safe_paciente/firebase_options.dart';
import 'package:health_safe_paciente/src/app.dart';
import 'package:health_safe_paciente/src/helpers/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => PermissionHandler(), lazy: false),
    ChangeNotifierProvider(create: (_) => AutenticacionService()),
    // ChangeNotifierProvider(create: (_) => SocketApiService()),
    ChangeNotifierProvider(
        create: (_) => PushNotificationService(), lazy: false),
  ], child: const MyApp()));
}
