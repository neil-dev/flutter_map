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


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Container(
      height: mediaQuery.size.height * 0.8,
      child: Stack(
        children: <Widget>[
          BlocConsumer<LookupBloc, LookupState>(listener: (context, state) {
            if (state is AtmLoaded) {
              setState(() {
                print('Atm loaded ${state.markers}');
                _markers = Set<Marker>.of(state.markers);
              });
            }
            if (state is PharmaLoaded) {
              setState(() {
                print('Pharmacy loaded ${state.markers}');
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
          }),
          Positioned(
            width: mediaQuery.size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.atm),
                        SizedBox(width: 10),
                        Text('ATM'),
                      ],
                    ),
                  ),
                  onTap: () {
                    BlocProvider.of<LookupBloc>(context).add(AtmLookup(
                        location: widget.currentPosition, radius: 2000));
                  },
                ),
                InkWell(
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.local_pharmacy),
                        SizedBox(width: 10),
                        Text('Pharmacy'),
                      ],
                    ),
                  ),
                  onTap: () {
                    BlocProvider.of<LookupBloc>(context).add(PharmaLookup(
                        location: widget.currentPosition, radius: 2000));
                  },
                ),
              ],
            ),
            top: 15,
            left: 20,
          ),
        ],
      ),
    );
  }
}
