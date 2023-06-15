import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:health_safe_paciente/src/models/entity/push_notifications/push_notification_message.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class PushNotificationService extends ChangeNotifier {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  AuthorizationStatus _status = AuthorizationStatus.notDetermined;
  final List<PushNotificationMessage> _notifications = [];

  AuthorizationStatus get status => _status;
  set status(AuthorizationStatus value) {
    _status = value;
    notifyListeners();
  }

  List<PushNotificationMessage> get notifications => _notifications;

  void addNotification(PushNotificationMessage value) {
    _notifications.add(value);
    notifyListeners();
  }

  PushNotificationService() {
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

    final notification = PushNotificationMessage(
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
