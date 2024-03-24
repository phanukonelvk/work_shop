import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeFormatter extends StatelessWidget {
  final String dateTimeString;
  final String format;

  DateTimeFormatter({
    required this.dateTimeString,
    this.format = 'dd.MM.yy', // Default format
  });

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedDateTime = DateFormat(format).format(dateTime);

    return Text(
      formattedDateTime,
      style: const TextStyle(
          fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold),
    );
  }
}
