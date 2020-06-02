import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'bloc.dart';
import 'package:flutter_map/repositories/repositories.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final PlaceRepository placeRepository;

  MapBloc({@required this.placeRepository}) : assert(placeRepository != null);

  @override
  MapState get initialState => MapEmpty();

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is AtmLookup) {
      yield* _mapAtmLookupToState(event);
    } else if (event is PharmaLookup) {
      yield* _mapPharmaLookupToState(event);
    }
  }

  Stream<MapState> _mapAppStartedToState() async* {
    try {
      final currentLocation = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      yield MapLoaded(
        currentPosition:
            LatLng(currentLocation.latitude, currentLocation.longitude),
      );
    } catch (_) {
      yield MapError();
    }
  }

  Stream<MapState> _mapAtmLookupToState(AtmLookup event) async* {
    try {
      final markers = await placeRepository.getPlacesMarkers(location: event.location, radius: event.radius, type: event.type);
      yield AtmLoaded(markers: markers);
    } catch (_) {
      yield LookupError();
    }
  }

  Stream<MapState> _mapPharmaLookupToState(PharmaLookup event) async* {
    try {
      final markers = await placeRepository.getPlacesMarkers(location: event.location, radius: event.radius, type: event.type);
      yield PharmaLoaded(markers: markers);
    } catch (_) {
      yield LookupError();
    }
  }
}
