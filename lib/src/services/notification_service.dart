import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:health_safe_paciente/src/models/models.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class NotificationService extends ChangeNotifier {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  AuthorizationStatus _status = AuthorizationStatus.notDetermined;
  final List<PushMessage> _notifications = [];

  AuthorizationStatus get status => _status;
  set status(AuthorizationStatus value) {
    _status = value;
    notifyListeners();
  }

  List<PushMessage> get notifications => _notifications;

  void addNotification(PushMessage value) {
    _notifications.add(value);
    notifyListeners();
  }

  NotificationService() {
    _init();
  }

  Future<void> _init() async {
    final settings = await messaging.getNotificationSettings();
    status = settings.authorizationStatus;

    _getFCMToken();
    _onForegroundMessage();
  }

  Future<String?> _getFCMToken() async {
    if (status != AuthorizationStatus.authorized) return null;
    return await messaging.getToken();
  }

  void _handleRemoteMessage(RemoteMessage message) {
    if (message.notification == null) return;

    final notification = PushMessage(
        messageId:
            message.messageId?.replaceAll(':', '').replaceAll('%', '') ?? '',
        title: message.notification!.title ?? '',
        body: message.notification!.body ?? '',
        sentDate: message.sentTime ?? DateTime.now(),
        data: message.data,
        imageUrl: message.notification!.android?.imageUrl ?? '');

    addNotification(notification);
  }

  void _onForegroundMessage() {
    FirebaseMessaging.onMessage.listen(_handleRemoteMessage);
  }
}
