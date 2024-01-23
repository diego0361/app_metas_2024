import 'package:flutter/material.dart';

Future<DateTime?> appDatePicker(
    {required BuildContext context, required DateTime initialDate, required DateTime firstDate, required DateTime lastDate, DatePickerMode initialDatePickerMode = DatePickerMode.day}) async {
  return await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
    initialDatePickerMode: initialDatePickerMode,
  );
}
