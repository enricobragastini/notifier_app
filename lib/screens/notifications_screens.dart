import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/notifications_provider.dart';
import '../widgets/notification_widget.dart';
import './add_notification_screen.dart';

class NotificationsScreen extends StatefulWidget {
  static const String routeName = "/notifications-screen";
  final String appBarTitle;

  const NotificationsScreen({Key? key, required this.appBarTitle})
      : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    final notifications =
        Provider.of<NotificationsProvider>(context).notifications;

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
        body: notifications.isEmpty
            ? Center(
                child: Text(
                  "Nothing to show here...\nTry adding a new notification!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              )
            : ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return NotificationWidget(
                      title: notifications[index].title,
                      description: notifications[index].description,
                      datetime: notifications[index].datetime);
                }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AddNotificationScreen.routeName);
          },
          child: const Icon(Icons.add),
        ));
  }
}
