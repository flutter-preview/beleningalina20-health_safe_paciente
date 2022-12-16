import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/app.dart';
import 'package:health_safe_paciente/src/services/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AutenticacionService()),
      // Socket
    ], child: const MyApp()));
