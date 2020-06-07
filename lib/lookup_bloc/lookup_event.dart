import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class LookupEvent extends Equatable {
  const LookupEvent();
}

class AtmLookup extends LookupEvent {
  final LatLng location;
  final int radius;
  final type = 'atm';

  const AtmLookup({@required this.location, @required this.radius}) : assert(location != null, radius != null);

  @override 
  List<Object> get props => [location, radius, type];
}

class PharmaLookup extends LookupEvent {
  final LatLng location;
  final int radius;
  final type = 'pharmacy';

  const PharmaLookup({@required this.location, @required this.radius}) : assert(location != null, radius != null);

  @override 
  List<Object> get props => [location, radius, type];
}

class RestaurantLookup extends LookupEvent {
  final LatLng location;
  final int radius;
  final type = 'restaurant';

  const RestaurantLookup({@required this.location, @required this.radius}) : assert(location != null, radius != null);

  @override 
  List<Object> get props => [location, radius, type];
}

class HospitalLookup extends LookupEvent {
  final LatLng location;
  final int radius;
  final type = 'hospital';

  const HospitalLookup({@required this.location, @required this.radius}) : assert(location != null, radius != null);

  @override 
  List<Object> get props => [location, radius, type];
}