import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class ChangeState extends Equatable {
  const ChangeState();

  @override
  List<Object> get props => [];
}

class NoChange extends ChangeState {}

class MapRefreshed extends ChangeState{
  final LatLng currentPosition;
  final String placeName;

  const MapRefreshed({@required this.currentPosition, this.placeName = 'Unknown'}) : assert(currentPosition != null);

  @override 
  List<Object> get props => [currentPosition, placeName];
}

class MapMovedState extends ChangeState {}

class ZoomInState extends ChangeState {}

class ZoomOutState extends ChangeState {}

class ChangeError extends ChangeState {}