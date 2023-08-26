import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static String dateFormated(var date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('MMMM:dd:yyyy').format(dateTime).toString();
  }

  static String timeFormated(var data, BuildContext context) {
    final localizations = MaterialLocalizations.of(context);
    return localizations.formatTimeOfDay(data).toString();
  }
}
