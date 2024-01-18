import 'package:intl/intl.dart';

bool stringIsNullOrEmpty(String? value) {
  if (value == null) {
    return true;
  } else if (value.isEmpty) {
    return true;
  } else {
    return false;
  }
}

bool stringToBool(dynamic value) {
  try {
    return (value as bool);
  } catch (e) {
    return false;
  }
}

String? dateTimeToString(DateTime? value) {
  try {
    if (value == null) return null;
    return DateFormat('dd/MM/yyyy').format(value);
  } catch (e) {
    return null;
  }
}

DateTime stringToDateTime(String value) {
  return DateFormat('dd/MM/yyyy').parse(value);
}

String dateToString(DateTime value) {
  return DateFormat('dd/MM/yyyy').format(value);
}
