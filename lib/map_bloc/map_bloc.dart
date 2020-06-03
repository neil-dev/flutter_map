import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'bloc.dart';


class MapBloc extends Bloc<MapEvent, MapState> {
  

  @override
  MapState get initialState => MapEmpty();

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } 
  }

  Stream<MapState> _mapAppStartedToState() async* {
    try {
      final currentLocation = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      final placeName = await _getPlace(
          LatLng(currentLocation.latitude, currentLocation.longitude));
      yield MapLoaded(
        currentPosition:
            LatLng(currentLocation.latitude, currentLocation.longitude),
        placeName: placeName,
      );
    } catch (_) {
      yield MapError();
    }
  }

 

  Future<String> _getPlace(LatLng userLocation) async {
    List<Placemark> currentPlace;
    try {
      currentPlace = await Geolocator().placemarkFromCoordinates(
          userLocation.latitude, userLocation.longitude);
    } catch (e) {
      currentPlace = null;
    }
    return currentPlace[0].locality;
  }
}
