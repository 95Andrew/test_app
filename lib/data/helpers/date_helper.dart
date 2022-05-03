import 'package:intl/intl.dart';

String transformationDate(String? date) {
  if (date != null) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd');
    final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    return serverFormater.format(displayDate);
  }
  return '';
}
