import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/services/api/api_services.dart';
import 'package:provider/provider.dart';
import 'package:health_safe_paciente/src/views/pages/pages.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';

class LoadingPage extends StatelessWidget {
  static const String routeName = "LoadingPage";
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final autenticacionService =
        Provider.of<AutenticacionApiService>(context, listen: false);

    return FutureBuilder(
        future: autenticacionService.isLoggedIn(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 0),
                    pageBuilder: (_, __, ___) => const LoginPage()));
          }

          if (snapshot.hasData) {
            bool autenticado = snapshot.data;

            if (autenticado) {
              // socket
              // socketService.connect();
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 0),
                      pageBuilder: (_, __, ___) => const HomePage()));
            } else {
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 0),
                      pageBuilder: (_, __, ___) => const LoginPage()));
            }
          }
          return Container(color: ColorsApp.azulLogin);
        });
  }
}
