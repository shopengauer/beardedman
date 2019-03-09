import 'package:mobile/data/dividends.dart';
import 'package:money/money.dart';

class Security {

  String ticker;
  String companyName;
  String logoName;
  List<Dividend> divList;

  Security.create({this.ticker, this.companyName, this.logoName, this.divList});


}


