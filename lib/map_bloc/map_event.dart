import 'package:equatable/equatable.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  List<Object> get props => [];
}

class AppStarted extends MapEvent {}

class MapMoved extends MapEvent {}

class RefreshMap extends MapEvent {}

class ZoomIn extends MapEvent {}

class ZoomOut extends MapEvent {}