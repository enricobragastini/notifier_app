// import 'package:intl/intl.dart';

class Notify {
  final String title;
  final String description;
  final DateTime datetime;

  Notify({
    required this.title,
    this.description = "",
    required this.datetime,
  });
}
