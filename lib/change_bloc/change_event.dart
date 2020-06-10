import 'package:equatable/equatable.dart';

abstract class ChangeEvent extends Equatable {
  const ChangeEvent();

  @override 
  List<Object> get props => [];
}

class MapMoved extends ChangeEvent {}

class RefreshMap extends ChangeEvent {}

class ZoomIn extends ChangeEvent {}

class ZoomOut extends ChangeEvent {}
