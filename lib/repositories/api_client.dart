import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'dart:io';

import 'package:flutter_map/models/model.dart';

class ApiClient {
  static const baseUrl = 'https://maps.googleapis.com/maps';
  final http.Client httpClient; 

  const ApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<String> getApiKey() async {
    final String apiKey = await File('').readAsString();
    return apiKey;
  }

  
}