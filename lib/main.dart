import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './screens/notifications_screens.dart';
import './screens/add_notification_screen.dart';
import './providers/notifications_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Bloccare la visualizzazione
  SystemChrome.setPreferredOrientations([
    // solo in verticale
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const jsonFileName = "notifications.json";

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotificationsProvider(),
      child: MaterialApp(
        title: 'Notifier',
        theme: ThemeData(
            primarySwatch: Colors.green,
            textTheme: const TextTheme(
                labelLarge:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                labelMedium:
                    TextStyle(fontWeight: FontWeight.w400, fontSize: 15))),
        home: const NotificationsScreen(appBarTitle: "Notifier"),
        routes: {
          AddNotificationScreen.routeName: (ctx) =>
              const AddNotificationScreen(),
        },
      ),
    );
  }
}
