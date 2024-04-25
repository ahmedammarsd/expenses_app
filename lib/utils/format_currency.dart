import 'package:intl/intl.dart';

formatCurrencyWithPoint<int>(int amount) {
  return NumberFormat("#,##0.00", "en_US").format(amount);
}

formatCurrencyWithDollar(int amount) {
  return NumberFormat.simpleCurrency(decimalDigits: 0).format(amount);
}
