import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  final String title;
  final String description;
  final DateTime datetime;

  const NotificationWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.datetime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Card(
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
            child: Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Icon(Icons.watch_later_outlined),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(datetime.toString())
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          )),
    );
  }
}
