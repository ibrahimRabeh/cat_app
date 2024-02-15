import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../cat.dart';

Future<List<Cat>> loadCats() async {
  final jsonString = await rootBundle.loadString('assets/cats.json');
  final jsonResponse = json.decode(jsonString) as List;
  return jsonResponse.map((cat) => Cat.fromJson(cat)).toList();
}
