import 'package:intl/intl.dart';

String formatTimestamp(DateTime timestamp) {
  final formatter = DateFormat('dd/MM/yy HH:mm');
  return formatter.format(timestamp);
}
