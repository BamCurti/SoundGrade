import 'dart:convert';
import 'package:flutter/services.dart';

Future<List<Map<String, dynamic>>> getDummyData(String path) async {
  final input = await rootBundle.loadString(path);
  final map = List<Map<String, dynamic>>.from(json.decode(input));
  return map;
}
