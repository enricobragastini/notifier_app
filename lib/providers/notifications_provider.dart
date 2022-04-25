import 'package:flutter/material.dart';

import '../models/notify.dart';

class NotificationsProvider with ChangeNotifier {
  final List<Notify> _notifications = [
    Notify(
        title: "Bevi l'acqua",
        datetime: DateTime.now().add(const Duration(minutes: 2)),
        description: "Ricordati di bere acqua"),
    Notify(
        title: "Bevi il vino",
        datetime: DateTime.now().add(const Duration(minutes: 5)),
        description: "Ricordati di bere il vino"),
    Notify(
        title: "Bevi l'acqua",
        datetime: DateTime.now().add(const Duration(minutes: 8)),
        description: "Ricordati di bere acqua"),
    Notify(
        title: "This is a very long reminder, very important title",
        datetime: DateTime.now().add(const Duration(minutes: 8)),
        description: "A very long reminder needs a very long description")
  ];

  List<Notify> get notifications {
    return [..._notifications];
  }

  void addNotification(Notify notification) {
    _notifications.add(notification);
    print(_notifications);
  }
}
