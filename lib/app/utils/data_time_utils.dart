class DateTimeUtil {
  static String formatTime(DateTime dateTime) {
    // Extracting hour, minute, and second components from the given DateTime
    int hour = dateTime.hour;
    int minute = dateTime.minute;

    // Determining if it's AM or PM
    String period = (hour < 12) ? 'AM' : 'PM';

    // Converting hour to 12-hour format
    if (hour > 12) {
      hour -= 12;
    } else if (hour == 0) {
      hour = 12;
    }

    // Formatting minute and second to two digits with leading zero if necessary
    String formattedMinute = (minute < 10) ? '0$minute' : '$minute';

    // Combining hour, minute, second, and period into a string
    return '$hour:$formattedMinute $period';
  }
}
