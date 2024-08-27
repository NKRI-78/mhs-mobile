import 'package:get_time_ago/get_time_ago.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class CustomMessages implements Messages {
  @override
  String prefixAgo() => '';

  @override
  String suffixAgo() => '';

  @override
  String secsAgo(int seconds) => 'baru saja';

  @override
  String minAgo(int minutes) => '1m';

  @override
  String minsAgo(int minutes) => '${minutes}m';

  @override
  String hourAgo(int minutes) => '1j';

  @override
  String hoursAgo(int hours) => '${hours}j';

  @override
  String dayAgo(int hours) => '1h';

  @override
  String daysAgo(int days) => '${days}h';

  @override
  String wordSeparator() => ' ';
}

class DateUntil {
  static String formatDate(DateTime dateTime) {
    final now = DateTime(dateTime.year, dateTime.month, dateTime.day,
        dateTime.hour, dateTime.minute);
    GetTimeAgo.setCustomLocaleMessages('id', CustomMessages());
    return GetTimeAgo.parse(now, locale: 'id', pattern: 'dd MMMM yyy');
  }
  static String formatDateEvent(DateTime formatDate) {
    initializeDateFormatting("id");
     return DateFormat.yMMMMd("id").format(formatDate);
  }

  static String getDate(DateTime dateTime) {
    final now = DateTime(dateTime.year, dateTime.month, dateTime.day,
        dateTime.hour, dateTime.minute);
    initializeDateFormatting("id");
    return DateFormat.yMMMMEEEEd("id").format(now);
  }

  static String parseDate(String formatDate) {
    DateTime dateParse = DateTime.parse(formatDate);
    final result =
        DateTime(dateParse.year, dateParse.month, dateParse.day, 9, 0, 0);
    String date = DateFormat("EEE dd MMMM, yyyy").format(result);
    return date;
  }

  static String getFormatedDate(String formatDate) {
    DateTime dateParse = DateTime.parse(formatDate);
    final result =
        DateTime(dateParse.year, dateParse.month, dateParse.day, 9, 0, 0);
    String date = DateFormat("yyyy-MM-dd").format(result);
    return date;
  }
  static String getFormatedDateWithHours(String formatDate) {
    DateTime dateParse = DateTime.parse(formatDate);
    final result = DateTime(dateParse.year, dateParse.month, dateParse.day, dateParse.hour, dateParse.minute, 9, 0, 0);
    initializeDateFormatting("id");
    String date = DateFormat("dd MMMM yyyy | HH:mm a","id_ID").format(result);
    return date;
  }

  static int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }
}
