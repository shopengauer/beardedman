import 'package:csv/csv.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class CsvDecoder {


  Future<List<List>> getRawData(String fileName) async {
    final csvCodec = new CsvCodec();
    final input = File(fileName).openRead();
    final list = await input.transform(Utf8Decoder()).transform(csvCodec.decoder).toList();
    print(list.isNotEmpty);
    return list;
 }

  Future<List<List<dynamic>>> getRawData2(String fileName) async {
    final csvCodec = new CsvCodec();
    final input = rootBundle.loadString(fileName);
    return await input.asStream().transform(csvCodec.decoder).toList();
  }

}