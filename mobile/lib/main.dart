import 'package:flutter/material.dart';
import 'package:mobile/data/dividends.dart';
import 'package:mobile/services/csv_utils.dart';
import 'dart:async';
import 'dart:io';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: new MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.ac_unit),
          ),
          body: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // return Text(snapshot.data[0][0]);
                return DividendList(snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
            future: new CsvUtils().getRawCsvData('assets/text/adm.txt'),
          ),
        ),
      ),
    );
  }
}

class DividendList extends StatelessWidget {
  List<Dividend> _divList;

  DividendList(List<List<dynamic>> ls) {
    _divList = DividendUtils.createDividendFromCsv(ls);
  }

  List<Card> divToTextConverter() {
    return _divList.map((div) {
      return Card(
          color: Colors.white70,
          child: ListTile(
              leading: Text(div.fDate, style: TextStyle(fontSize: 16),), trailing: Text(div.amount.toString())));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: divToTextConverter());
  }
}
