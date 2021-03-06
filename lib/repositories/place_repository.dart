import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'api_client.dart';

class PlaceRepository {
  final ApiClient apiClient;

  PlaceRepository({this.apiClient}) : assert(apiClient != null);

  Future<List<Marker>> getPlacesMarkers({
    LatLng location,
    int radius,
    String type,
  }) async {
    final places = await apiClient.getPlaces(
        location: location, radius: radius, type: type);
    final locationPin = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/$type.png');
    return places
        .map((place) => Marker(
              markerId: MarkerId(place.id),
              position: LatLng(place.location['lat'], place.location['lng']),
              draggable: false,
              infoWindow: InfoWindow(title: place.name),
              icon: locationPin,
              onTap: () {},
            ))
        .toList();
  }
}
