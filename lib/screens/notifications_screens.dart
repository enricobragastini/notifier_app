import 'package:flutter/material.dart';

import '../models/notify.dart';
import '../widgets/notification_widget.dart';

class NotificationsScreen extends StatefulWidget {
  final String appBarTitle;

  const NotificationsScreen({Key? key, required this.appBarTitle})
      : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<Notify> notifications = [
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
        description: "Ricordati di bere acqua")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.appBarTitle),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
              tooltip: "Settings",
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
              tooltip: "More options",
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              return NotificationWidget(
                  title: notifications[index].title,
                  description: notifications[index].description,
                  datetime: notifications[index].datetime);
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ));
  }
}
