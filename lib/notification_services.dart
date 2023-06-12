import 'dart:html';

import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:permission_handler/permission_handler.dart';

class NotificationServices {
  final FirebaseAnalytics analytics = FirebaseAnalytics();

  void requestNotificationPermission() async {
    PermissionStatus status = await Permission.notification.request();

    if (status.isGranted) {
      // Notification permissions granted
      print("hi");
    } else if (status.isDenied) {
      requestNotificationPermission();
    } else if (status.isPermanentlyDenied) {
      // Notification permissions permanently denied, navigate to app settings
      openAppSettings();
    }
  }
}
