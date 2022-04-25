import 'package:flutter/material.dart';

import '../models/reminder.dart';

class NotificationsProvider with ChangeNotifier {
  final List<Reminder> _notifications = [
    // Reminder(
    //     title: "Bevi l'acqua",
    //     datetime: DateTime.now().add(const Duration(minutes: 2)),
    //     description: "Ricordati di bere acqua"),
    // Reminder(
    //     title: "Bevi il vino",
    //     datetime: DateTime.now().add(const Duration(minutes: 5)),
    //     description: "Ricordati di bere il vino"),
    // Reminder(
    //     title: "Bevi l'acqua",
    //     datetime: DateTime.now().add(const Duration(minutes: 8)),
    //     description: "Ricordati di bere acqua"),
    // Reminder(
    //     title: "This is a very long reminder, very important title",
    //     datetime: DateTime.now().add(const Duration(minutes: 8)),
    //     description: "A very long reminder needs a very long description")
  ];

  List<Reminder> get notifications {
    return [..._notifications];
  }

  void addNotification(Reminder notification) {
    _notifications.add(notification);
    notifyListeners();
  }
}
