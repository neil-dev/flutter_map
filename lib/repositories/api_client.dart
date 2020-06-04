import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

import 'package:flutter_map/models/model.dart';

class ApiClient {
  static const baseUrl = 'https://maps.googleapis.com/maps';
  final http.Client httpClient;

  const ApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<List<Place>> getPlaces({
    @required LatLng location,
    @required int radius,
    @required String type,
  }) async {
    final response = await getResponse(location: location, radius: radius, type: type);
    final responseJson = jsonDecode(response);
    return Place.fromJson(responseJson, type);
  }

  Future<String> getResponse({
    @required LatLng location,
    @required int radius,
    @required String type,
  }) async {
    ApiKey k = ApiKey();
    final String apiKey = k.getKey;

    final placesUrl =
        '$baseUrl/api/place/nearbysearch/json?location=${location.latitude},${location.longitude}&radius=$radius&type=$type&key=$apiKey';
    print(placesUrl);
    http.Response placesResponse;
    try {
      placesResponse = await this.httpClient.get(placesUrl);
    } catch (error) {
      print('$error error occured');
    }
    if (placesResponse.statusCode != 200) {
      print('Error in receiving response!');
      throw Exception('error getting response for location');
    }
    return placesResponse.body;
  }
}
