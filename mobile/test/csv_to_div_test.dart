import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/data/dividends.dart';


void main() {

  test('Create div object list from list<list<dynamic>', () {
    List<List<dynamic>> divList = [['1994-08-06', '0.28','2000-08-06', '0.35',]];
    List<Dividend> list = DividendUtils.createDividendFromCsv(divList);
    expect(2, list.length);

  });

  
}
