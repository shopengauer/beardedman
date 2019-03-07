import 'package:mobile/model/domain_objects.dart';
import 'package:money/money.dart';

List<Dividend> admDivs = [
  Dividend(
      dateTime: DateTime.parse('1994-08-16'),
      amount: Money.fromDouble(0.0, Currency("USD")))
];
