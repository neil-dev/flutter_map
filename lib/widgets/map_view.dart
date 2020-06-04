import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/lookup_bloc/bloc.dart';

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

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<LookupBloc, LookupState>(listener: (context, state) {
      if (state is AtmLoaded) {
        setState(() {
          _markers = Set<Marker>.of(state.markers);
        });
      }
      if (state is PharmaLoaded) {
        setState(() {
          _markers = Set<Marker>.of(state.markers);
        });
      }
    }, builder: (context, state) {
      if (state is AtmLoaded || state is PharmaLoaded) {
        return GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: widget.currentPosition,
            zoom: 11,
          ),
          onMapCreated: (GoogleMapController controller) {
            this._controller = controller;
          },
          myLocationButtonEnabled: true,
          markers: _markers,
        );
      }
      return GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          this._controller = controller;
        },
        initialCameraPosition: CameraPosition(
          target: widget.currentPosition,
          zoom: 11,
        ),
        markers: _markers,
      );
    });
  }
}
