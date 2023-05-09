import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:health_safe_paciente/firebase_options.dart';
import 'package:health_safe_paciente/src/app.dart';
import 'package:health_safe_paciente/src/helpers/utils/permission_handler.dart';
import 'package:health_safe_paciente/src/services/notification_service.dart';
import 'package:health_safe_paciente/src/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => PermissionHandler(), lazy: false),
    ChangeNotifierProvider(create: (_) => AutenticacionService()),
    ChangeNotifierProvider(create: (_) => SocketService()),
    ChangeNotifierProvider(create: (_) => NotificationService(), lazy: false),
  ], child: const MyApp()));
}
