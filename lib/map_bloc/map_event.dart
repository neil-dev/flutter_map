import 'package:equatable/equatable.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  List<Object> get props => [];
}

class AppStarted extends MapEvent {}

