import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/lookup_bloc/bloc.dart';
import 'package:flutter_map/lookup_bloc/lookup_bloc.dart';
import 'package:flutter_map/change_bloc/bloc.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewer extends StatefulWidget {
  final LatLng currentPosition;

  MapViewer(this.currentPosition);

  @override
  _MapViewerState createState() => _MapViewerState();
}

class _MapViewerState extends State<MapViewer> {
  
  GoogleMapController _controller;
  Set<Marker> _markers = {};
  BitmapDescriptor locationPin;
  Marker currentLocationMarker;
  double _zoomValue = 11;
  LatLng _currentPosition;

  @override
  void initState() {
    _currentPosition = widget.currentPosition;
    setCustomPin();
    currentLocationMarker = Marker(
      markerId: MarkerId('currentLocation'),
      icon: locationPin,
      position: _currentPosition,
    );
    super.initState();
  }

  void setCustomPin() async {
    locationPin = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/pin.png');
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangeBloc, ChangeState>(
      listener: (context, state) {
        if (state is MapRefreshed) {
          setState(() {
            _currentPosition = state.currentPosition;
            _controller
                .moveCamera(CameraUpdate.newLatLng(_currentPosition));
          });
        } else if (state is ZoomInState) {
          _zoomValue += 0.3;
          _controller.moveCamera(
              CameraUpdate.newLatLngZoom(_currentPosition, _zoomValue));
              BlocProvider.of<ChangeBloc>(context).add(MapMoved());
        } else if (state is ZoomOutState) {
          _zoomValue -= 0.3;
          _controller.moveCamera(
              CameraUpdate.newLatLngZoom(_currentPosition, _zoomValue));
              BlocProvider.of<ChangeBloc>(context).add(MapMoved());
        }
      },
      child: BlocConsumer<LookupBloc, LookupState>(
        listener: (context, state) {
          if (state is AtmLoaded) {
            setState(() {
              _markers = Set<Marker>.of(state.markers);
              _markers.add(currentLocationMarker);
            });
          } else if (state is PharmaLoaded) {
            setState(() {
              _markers = Set<Marker>.of(state.markers);
              _markers.add(currentLocationMarker);
            });
          } else if (state is RestaurantLoaded) {
            setState(() {
              _markers = Set<Marker>.of(state.markers);
              _markers.add(currentLocationMarker);
            });
          } else if (state is HospitalLoaded) {
            setState(() {
              _markers = Set<Marker>.of(state.markers);
              _markers.add(currentLocationMarker);
            });
          }
        },
        builder: (context, state) {
          if (state is AtmLoaded ||
              state is PharmaLoaded ||
              state is RestaurantLoaded ||
              state is HospitalLoaded) {
            _zoomValue = 13;
            _controller.moveCamera(
                CameraUpdate.newLatLngZoom(_currentPosition, _zoomValue));
          }
          return GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              print('Pin: $locationPin');
              setState(() {
                currentLocationMarker = Marker(
                  markerId: MarkerId('currentLocation'),
                  icon: locationPin,
                  position: _currentPosition,
                );
                _markers.add(currentLocationMarker);
              });
              this._controller = controller;
            },
            initialCameraPosition: CameraPosition(
              target: _currentPosition,
              zoom: _zoomValue,
            ),
            markers: _markers,
            zoomControlsEnabled: false,
            onCameraMove: (cameraposition)  {     
              if (cameraposition.target != _currentPosition) {
                BlocProvider.of<ChangeBloc>(context).add(MapMoved());
              }
            },
          );
        },
      ),
    );
  }
}
