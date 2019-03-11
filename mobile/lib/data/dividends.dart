import 'package:money/money.dart';
import 'package:date_format/date_format.dart';



/// Class for working with dividend data

class DividendUtils {
  
 static List<Dividend> createDividendFromCsv(List<List<dynamic>> divCsvList) {
    List<Dividend> dividends = [];
    List<dynamic> divList = divCsvList[0];
    for (var i = 0; i < divList.length; i = i + 2) {
      dividends.add(Dividend(
          dateTime: DateTime.parse(divList[i]),
          amount: Money.fromDouble(divList[i + 1], Currency("USD"))));
    }
    dividends.sort();

    return dividends;
  }
  
}

///
/// Domain class for dividends 
/// 
class Dividend implements Comparable<Dividend>{
  DateTime dateTime;
  Money amount;
  double percent;

  Dividend({this.dateTime, this.amount, this.percent});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Dividend &&
              runtimeType == other.runtimeType &&
              dateTime == other.dateTime &&
              amount == other.amount;

  @override
  int get hashCode =>
      dateTime.hashCode ^
      amount.hashCode;

  @override
  int compareTo(Dividend other) {
    return other.dateTime.compareTo(this.dateTime);
  }

  @override
  String toString() {
    return 'Dividend{dateTime: ${formatDate(dateTime, [yyyy, '-', mm, '-', dd])}, amount: $amount}';
  }

  String get fDate {
   return formatDate(dateTime, [yyyy, '-', mm, '-', dd]);
  }


}
