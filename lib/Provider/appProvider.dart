import 'dart:convert';
import 'package:fetch_data/Module.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class appProvider extends ChangeNotifier{
  Future<List<Module>> fetchPosts() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  if (response.statusCode == 200) {
  final List<dynamic> jsonResponse = jsonDecode(response.body);
  return jsonResponse.map((data) => Module.fromJson(data)).toList();
  } else {
  throw Exception('Failed to load posts');
  }
  }
}