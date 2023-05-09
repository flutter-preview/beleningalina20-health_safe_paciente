import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:health_safe_paciente/src/services/utils/environments.dart';
import 'package:health_safe_paciente/src/services/utils/local_storage_manager.dart';

enum ServerStatus { online, offline, connecting }

class SocketService with ChangeNotifier {
  // Tambien se lo puede usar con streams
  // Solo debe saber cual es el estado de los sockets
  ServerStatus _serverStatus = ServerStatus.connecting;
  late io.Socket _socket;

  ServerStatus get serverStatus => _serverStatus;
  io.Socket get socket => _socket;

  Function get emit => _socket.emit;

  void connect() async {
    final token = await LocalStorage.localStorage.getToken();
    // Dart Client
    _socket = io.io(Environments.socketUrl, {
      'transports': ['websocket'],
      'autoConnect': true,
      'forceNew': true,
      'extraHeaders': {'x-token': token}
    });

    _socket.on('connect', (_) {
      _serverStatus = ServerStatus.online;
      notifyListeners();
    });

    _socket.on('disconnect', (data) {
      _serverStatus = ServerStatus.offline;
      notifyListeners();
    });
  }

  void disconnect() {
    _socket.disconnect();
  }
}
