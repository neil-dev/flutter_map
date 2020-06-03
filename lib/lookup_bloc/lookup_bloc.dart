import 'dart:async';
import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';

import 'bloc.dart';
import 'package:flutter_map/repositories/repositories.dart';



class LookupBloc extends Bloc<LookupEvent, LookupState> {
  final PlaceRepository placeRepository;

  LookupBloc({@required this.placeRepository}) : assert(placeRepository != null);

  @override
  LookupState get initialState => LookupInitial();

  @override
  Stream<LookupState> mapEventToState(
    LookupEvent event,
  ) async* {
    if (event is AtmLookup) {
      yield* _mapAtmLookupToState(event);
    } else if (event is PharmaLookup) {
      yield* _mapPharmaLookupToState(event);
    }
  }

   Stream<LookupState> _mapAtmLookupToState(AtmLookup event) async* {
    try {
      final markers = await placeRepository.getPlacesMarkers(
          location: event.location, radius: event.radius, type: event.type);
      yield AtmLoaded(markers: markers);
    } catch (_) {
      yield LookupError();
    }
  }

  Stream<LookupState> _mapPharmaLookupToState(PharmaLookup event) async* {
    try {
      final markers = await placeRepository.getPlacesMarkers(
          location: event.location, radius: event.radius, type: event.type);
      yield PharmaLoaded(markers: markers);
    } catch (_) {
      yield LookupError();
    }
  }
}
