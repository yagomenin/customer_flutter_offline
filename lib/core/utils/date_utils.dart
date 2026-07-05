import 'package:intl/intl.dart';

class AppDateUtils {
  static String formatDateToDayMonthYear({required DateTime date}) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }
}
