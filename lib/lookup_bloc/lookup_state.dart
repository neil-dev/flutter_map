import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class LookupState extends Equatable {
  const LookupState();

  @override 
  List<Object> get props => [];
}

class LookupInitial extends LookupState {}

class LookupError extends LookupState {}

class AtmLoaded extends LookupState {
  final List<Marker> markers;

  const AtmLoaded({@required this.markers});

  @override 
  List<Object> get props => [markers];

}

class PharmaLoaded extends LookupState {
  final List<Marker> markers;

  const PharmaLoaded({@required this.markers});

  @override 
  List<Object> get props => [markers];
}
class RestaurantLoaded extends LookupState {
  final List<Marker> markers;

  const RestaurantLoaded({@required this.markers});

  @override 
  List<Object> get props => [markers];
}
class HospitalLoaded extends LookupState {
  final List<Marker> markers;

  const HospitalLoaded({@required this.markers});

  @override 
  List<Object> get props => [markers];
}
