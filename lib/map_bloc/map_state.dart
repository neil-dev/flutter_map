import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';


abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

class MapLoaded extends MapState {
  final LatLng currentPosition;
  final String placeName;

  const MapLoaded({@required this.currentPosition, this.placeName = 'Unknown'}) : assert(currentPosition != null);

  @override 
  List<Object> get props => [currentPosition, placeName];
}

class MapEmpty extends MapState {}

class MapError extends MapState {}


