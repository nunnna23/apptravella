import 'package:signalr_netcore/signalr_client.dart';
import 'package:flutter/foundation.dart';

class NotificationService {
  HubConnection? hubConnection;
  final String hubUrl =
      "http://travella.runasp.net/notificationsHub"; // عنوان SignalR Hub
  ValueNotifier<List<Map<String, String>>> notifications = ValueNotifier([]);

  NotificationService() {
    _initSignalR();
  }

  Future<void> _initSignalR() async {
    hubConnection = HubConnectionBuilder().withUrl(hubUrl).build();

    // استقبال الإشعارات من الـ Hub
    hubConnection?.on("ReceiveNotification", (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        final notification = {
          "title": "New Notification",
          "description": arguments[0].toString(),
          "time": "Just Now",
          "icon": "Icons.notifications", // هنحولها لاحقًا لـ IconData
        };
        notifications.value = [notification, ...notifications.value];
      }
    });

    try {
      await hubConnection?.start();
      print("SignalR Connected");
    } catch (e) {
      print("SignalR Connection Error: $e");
    }
  }

  Future<void> sendNotification(String userId, String message) async {
    try {
      await hubConnection?.invoke("SendNotification", args: [userId, message]);
    } catch (e) {
      print("Error sending notification: $e");
    }
  }

  void dispose() {
    hubConnection?.stop();
  }
}
