import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  List<Object> get props => [];
}

class AppStarted extends MapEvent {}

class AtmLookup extends MapEvent {
  final LatLng location;
  final int radius;
  final type = 'atm';

  const AtmLookup({@required this.location, @required this.radius}) : assert(location != null, radius != null);

  @override 
  List<Object> get props => [location, radius, type];
}

class PharmaLookup extends MapEvent {
  final LatLng location;
  final int radius;
  final type = 'pharmacy';

  const PharmaLookup({@required this.location, @required this.radius}) : assert(location != null, radius != null);

  @override 
  List<Object> get props => [location, radius, type];
}
