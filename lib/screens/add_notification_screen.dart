import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddNotificationScreen extends StatefulWidget {
  static const String routeName = "/add-notification";

  const AddNotificationScreen({Key? key}) : super(key: key);

  @override
  _AddNotificationScreenState createState() => _AddNotificationScreenState();
}

class _AddNotificationScreenState extends State<AddNotificationScreen> {
  final _titleEditingContoller = TextEditingController();
  final _descriptionEditingContoller = TextEditingController();
  DateTime? _selectedDate;

  void _presentDatePicker() {
    DatePicker.showDateTimePicker(context,
        showTitleActions: true,
        minTime: DateTime.now(),
        maxTime: DateTime.now().add(const Duration(days: 365)),
        onConfirm: (pickedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Add Notification"), actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {},
          )
        ]),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextInputWithIconWidget(
                  label: "Title",
                  icon: Icons.text_fields,
                  controller: _titleEditingContoller),
              TextInputWithIconWidget(
                  label: "Description",
                  icon: Icons.description_outlined,
                  controller: _descriptionEditingContoller),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.date_range,
                              size: 35,
                            )),
                        Expanded(
                          flex: 6,
                          child: Text(
                            (_selectedDate == null)
                                ? "Choose a datetime!"
                                : DateFormat("dd/MM/yyyy hh:mm")
                                    .format(_selectedDate!),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: TextButton(
                              onPressed: _presentDatePicker,
                              child: const Text(
                                "Choose date",
                                textAlign: TextAlign.center,
                              )),
                        )
                      ]))
            ],
          ),
        ));
  }
}

class TextInputWithIconWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  const TextInputWithIconWidget(
      {Key? key,
      required this.label,
      required this.icon,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: Icon(
                icon,
                size: 35,
              )),
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: TextField(
                decoration: InputDecoration(labelText: label),
                controller: controller,
                textInputAction: TextInputAction.next,
              ),
            ),
          )
        ],
      ),
    );
  }
}
