import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/lookup_bloc/bloc.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_map/repositories/repositories.dart';
import 'package:http/http.dart' as http;

class MapViewer extends StatefulWidget {
  final LatLng currentPosition;

  const MapViewer(this.currentPosition);

  @override
  _MapViewerState createState() => _MapViewerState();
}

class _MapViewerState extends State<MapViewer> {
  GoogleMapController _controller;
  // final PlaceRepository placeRepository = PlaceRepository(
  //   apiClient: ApiClient(
  //     httpClient: http.Client(),
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    Set<Marker> markers = {};

    Future<void> _onMapCreated(GoogleMapController controller) async {
      setState(() {
        markers.clear();
        markers.add(Marker(
            markerId: MarkerId('4d1edce69b3835d5274453de7402554196bbc40a'),
            alpha: 1.0,
            anchor: Offset(0.5, 1.0),
            consumeTapEvents: false,
            draggable: false,
            flat: false,
            infoWindow: InfoWindow(
              title: 'Wells Fargo ATM',
            )));
      });
    }

    return Container(
      height: mediaQuery.size.height * 0.8,
      child: Stack(
        children: <Widget>[
          BlocConsumer<LookupBloc, LookupState>(listener: (context, state) {
            if (state is AtmLoaded) {
              setState(() {
                print('Atm loaded ${state.markers}');
                markers = Set<Marker>.of(state.markers);
              });
            }
          }, builder: (context, state) {
            if (state is AtmLoaded) {
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
                markers: markers,
              );
            }
            return GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: const LatLng(0, 0),
                zoom: 2,
              ),
              markers: markers,
            );
            //   return GoogleMap(
            //       mapType: MapType.normal,
            //       initialCameraPosition: CameraPosition(
            //         target: widget.currentPosition,
            //         zoom: 11,
            //       ),
            //       onMapCreated: (GoogleMapController controller) {
            //         this._controller = controller;
            //       },
            //       myLocationButtonEnabled: true,
            //       markers: markers,
            //     );
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
                        Text('ATM'),
                      ],
                    ),
                  ),
                  onTap: () {
                    BlocProvider.of<LookupBloc>(context).add(AtmLookup(
                        location: widget.currentPosition, radius: 5000));
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
                        Text('Pharmacy'),
                      ],
                    ),
                  ),
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
