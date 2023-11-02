import 'dart:convert';
import 'package:flutter/services.dart';

Future<List<Map<String, dynamic>>> getJsonListData(String path) async {
  final input = await rootBundle.loadString(path);
  final listMap = List<Map<String, dynamic>>.from(json.decode(input));
  return listMap;
}

Future<Map<String, dynamic>> getJsonData(String path) async {
  final input = await rootBundle.loadString(path);
  final map = Map<String, dynamic>.from(json.decode(input));
  return map;
}
