import 'package:intl/intl.dart';

/// Centralized Indian Rupee Currency Formatter
class AppCurrencyFormatter {
  AppCurrencyFormatter._();

  static final NumberFormat _inrFormatter = NumberFormat.currency(
    locale: 'en_IN',
    symbol: '₹',
    decimalDigits: 2,
  );

  static final NumberFormat _inrCompact = NumberFormat.currency(
    locale: 'en_IN',
    symbol: '₹',
    decimalDigits: 0,
  );

  /// Format as ₹1,23,456.00
  static String format(num amount) {
    return _inrFormatter.format(amount);
  }

  /// Format as ₹1,23,456 (no fractional paise)
  static String formatCompact(num amount) {
    return _inrCompact.format(amount);
  }
}

/// Centralized Date and Time Formatter for the SaaS UI
class AppDateTimeFormatter {
  AppDateTimeFormatter._();

  static final DateFormat _dateFormat = DateFormat('dd MMM yyyy');
  static final DateFormat _timeFormat = DateFormat('hh:mm a');
  static final DateFormat _dateTimeFormat = DateFormat('dd MMM yyyy, hh:mm a');
  static final DateFormat _shortDate = DateFormat('dd/MM/yyyy');

  /// Formats date as '12 Oct 2026'
  static String formatDate(DateTime dateTime) {
    return _dateFormat.format(dateTime);
  }

  /// Formats time as '02:30 PM'
  static String formatTime(DateTime dateTime) {
    return _timeFormat.format(dateTime);
  }

  /// Formats date and time as '12 Oct 2026, 02:30 PM'
  static String formatDateTime(DateTime dateTime) {
    return _dateTimeFormat.format(dateTime);
  }

  /// Formats date as '12/10/2026'
  static String formatShortDate(DateTime dateTime) {
    return _shortDate.format(dateTime);
  }
}
