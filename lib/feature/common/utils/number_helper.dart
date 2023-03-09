import 'package:intl/intl.dart';

class NumberHelper {
  String convertToIDR({required int price, int decimalDigit = 2}) {
    return NumberFormat.currency(
      locale: 'id',
      symbol: 'IDR ',
      decimalDigits: decimalDigit,
    ).format(price);
  }

  String convertToDecimal({required int number}) {
    return NumberFormat.decimalPattern().format(number);
    // return NumberFormat.currency(
    //   locale: 'id',
    //   symbol: 'IDR ',
    //   // decimalDigits: 0,
    // ).format(number);
  }
}
