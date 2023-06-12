import 'package:intl/intl.dart';

class Utility {
  static final rupiah =
      NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0);
}