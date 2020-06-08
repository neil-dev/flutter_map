import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/lookup_bloc/bloc.dart';
import 'package:flutter_map/lookup_bloc/lookup_bloc.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewer extends StatefulWidget {
  final LatLng currentPosition;

  const MapViewer(this.currentPosition);

  @override
  _MapViewerState createState() => _MapViewerState();
}

class _MapViewerState extends State<MapViewer> {
  GoogleMapController _controller;
  Set<Marker> _markers = {};
  BitmapDescriptor locationPin;
  Marker currentLocationMarker;

  @override
  void initState() {
    setCustomPin();
    currentLocationMarker = Marker(
            markerId: MarkerId('currentLocation'),
            icon: locationPin,
            position: widget.currentPosition,
          );
    super.initState();
  }

  void setCustomPin() async {
    locationPin = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.66), 'assets/pin.png');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LookupBloc, LookupState>(listener: (context, state) {
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
    }, builder: (context, state) {
      if (state is AtmLoaded ||
          state is PharmaLoaded ||
          state is RestaurantLoaded ||
          state is HospitalLoaded) {
        _controller
            .moveCamera(CameraUpdate.newLatLngZoom(widget.currentPosition, 13));
      }
      return GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          print('Pin: $locationPin');
          setState(() {
            currentLocationMarker = Marker(
            markerId: MarkerId('currentLocation'),
            icon: locationPin,
            position: widget.currentPosition,
          );
            _markers.add(currentLocationMarker);
          });
          this._controller = controller;
        },
        initialCameraPosition: CameraPosition(
          target: widget.currentPosition,
          zoom: 11,
        ),
        markers: _markers,
        zoomControlsEnabled:  false,
      );
    });
  }
}
