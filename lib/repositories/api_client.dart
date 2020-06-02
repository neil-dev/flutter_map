import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'dart:io';

import 'package:flutter_map/models/model.dart';

class ApiClient {
  static const baseUrl = 'https://maps.googleapis.com/maps';
  final http.Client httpClient;

  const ApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<String> getApiKey() async {
    final String apiKey =
        await File('package:flutter_map/models/key.txt').readAsString();
    return apiKey;
  }

  Future<List<Place>> getPlaces({
    @required LatLng location,
    @required int radius,
    @required String type,
  }) async {
    final String apiKey = await getApiKey();
    final placesUrl = '$baseUrl/api/place/nearbysearch/json?location=${location.latitude},${location.longitude}&radius=$radius&type=$type&key=$apiKey';
    final placesResponse = await this.httpClient.get(placesUrl);

    if (placesResponse.statusCode != 200) {
      throw Exception('error getting response for location');
    }

    final responseJson = jsonDecode(placesResponse.body);
    return Place.fromJson(responseJson, type);
  }
}
