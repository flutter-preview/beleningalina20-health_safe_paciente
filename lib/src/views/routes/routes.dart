import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/views/pages/pages.dart';

Map<String, WidgetBuilder> getApplicationRoutes() => <String, WidgetBuilder>{
      LoginPage.routeName: (_) => const LoginPage(),
      RegistroUsuarioPage.routeName: (_) => const RegistroUsuarioPage(),
      HomePage.routeName: (_) => const HomePage(),
      BusquedaProfesionalesPage.routeName: (_) =>
          const BusquedaProfesionalesPage(),
      ListadoProfesionalesPage.routeName: (_) =>
          const ListadoProfesionalesPage(),
      PerfilProfesionalPage.routeName: (_) => const PerfilProfesionalPage(),
      DetalleSolicitudTurnoPage.routeName: (_) =>
          const DetalleSolicitudTurnoPage(),
      PagoTurnoPage.routeName: (_) => const PagoTurnoPage(),
      MisTurnosPage.routeName: (_) => const MisTurnosPage(),
      DetalleTurnoPage.routeName: (_) => const DetalleTurnoPage(),
      HomeChatPage.routeName: (_) => const HomeChatPage(),
      ChatPage.routeName: (_) => const ChatPage(),
      VideollamadaPage.routeName: (_) => const VideollamadaPage(),
    };
