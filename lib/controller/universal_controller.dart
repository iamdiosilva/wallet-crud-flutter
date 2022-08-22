import 'package:intl/intl.dart';

class UniversalController {
  //formatting the date and time
  final dateFormat = DateFormat(DateFormat.YEAR_NUM_MONTH_DAY, 'pt_BR');
  final hourFormat = DateFormat(DateFormat.HOUR_MINUTE_SECOND, 'pt_BR');

  //formatting the number
  final numberFormatPTBR = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$', decimalDigits: 2);
}
