// import 'package:intl/intl.dart';

class Reminder {
  final String title;
  final String description;
  final DateTime datetime;

  Reminder({
    required this.title,
    this.description = "",
    required this.datetime,
  });
}
