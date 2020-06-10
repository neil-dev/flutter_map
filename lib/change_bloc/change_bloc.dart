import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'bloc.dart';

class ChangeBloc extends Bloc<ChangeEvent, ChangeState> {
  @override
  ChangeState get initialState => NoChange();

  @override
  Stream<ChangeState> mapEventToState(
    ChangeEvent event,
  ) async* {
      if(event is MapMoved) {
      yield* _mapMapMovedToState();
    } else if (event is RefreshMap) {
      yield* _mapRefreshMapToState();
    } else if (event is ZoomIn) {
      yield* _mapZoomInToState();
    } else if (event is ZoomOut) {
      yield* _mapZoomOutToState();
    }
  }

  Stream<ChangeState> _mapMapMovedToState() async* {
    yield MapMovedState();
  }

  Stream<ChangeState> _mapRefreshMapToState() async* {
    try {
      final currentLocation = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      final placeName = await _getPlace(
          LatLng(currentLocation.latitude, currentLocation.longitude));
      yield MapRefreshed(
        currentPosition:
            LatLng(currentLocation.latitude, currentLocation.longitude),
        placeName: placeName,
      );
    } catch (_) {
      yield ChangeError();
    }
  }

  Stream<ChangeState> _mapZoomInToState() async* {
    yield ZoomInState();
  }
  Stream<ChangeState> _mapZoomOutToState() async* {
    yield ZoomOutState();
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
