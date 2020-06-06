import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/lookup_bloc/bloc.dart';
import 'package:flutter_map/map_bloc/bloc.dart';
import 'package:flutter_map/widgets/widgets.dart';
import 'package:flutter_map/repositories/repositories.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<bool> isTapped = [false, false, false, false];

  void onTap(
      LatLng currentPosition, String type, BuildContext context, int id) {
    setState(() {
      for (int i = 0; i < isTapped.length; i++) {
        isTapped[i] = false;
      }
      isTapped[id] = true;
    });
    if (type.compareTo('atm') == 0) {
      BlocProvider.of<LookupBloc>(context)
          .add(AtmLookup(location: currentPosition, radius: 2000));
    } else if (type.compareTo('pharmacy') == 0) {
      BlocProvider.of<LookupBloc>(context)
          .add(PharmaLookup(location: currentPosition, radius: 2000));
    } else if (type.compareTo('restaurant') == 0) {
      BlocProvider.of<LookupBloc>(context)
          .add(PharmaLookup(location: currentPosition, radius: 2000));
    } else if (type.compareTo('hospital') == 0) {
      BlocProvider.of<LookupBloc>(context)
          .add(PharmaLookup(location: currentPosition, radius: 2000));
    }
  }

  @override
  Widget build(BuildContext context) {
    final PlaceRepository placeRepository = PlaceRepository(
      apiClient: ApiClient(
        httpClient: http.Client(),
      ),
    );
    final mediaQuery = MediaQuery.of(context);
    print('height: ${mediaQuery.size.height}\twidth: ${mediaQuery.size.width}');
    return Scaffold(
      appBar: AppBar(title: Text('Map')),
      body: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          if (state is MapLoaded) {
            var index = 3;
            return Container(
              child: BlocProvider(
                create: (context) =>
                    LookupBloc(placeRepository: placeRepository),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    MapViewer(state.currentPosition),
                    Positioned(
                      child: LocationBar(state.placeName),
                      top: mediaQuery.size.height * 0.02,
                    ),
                    Positioned(
                      child: Container(
                        width: mediaQuery.size.width,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 15),
                              ChoiceCard(
                                currentPosition: state.currentPosition,
                                type: 'atm',
                                icon: Icons.atm,
                                id: 0,
                                isTapped: isTapped[0],
                                onTap: onTap,
                              ),
                              SizedBox(width: 20),
                              ChoiceCard(
                                currentPosition: state.currentPosition,
                                type: 'pharmacy',
                                icon: Icons.local_pharmacy,
                                id: 1,
                                isTapped: isTapped[1],
                                onTap: onTap,
                              ),
                              SizedBox(width: 20),
                              ChoiceCard(
                                currentPosition: state.currentPosition,
                                type: 'restaurant',
                                icon: Icons.restaurant,
                                id: 2,
                                isTapped: isTapped[2],
                                onTap: onTap,
                              ),
                              SizedBox(width: 20),
                              ChoiceCard(
                                currentPosition: state.currentPosition,
                                type: 'hospital',
                                icon: Icons.restaurant,
                                id: 3,
                                isTapped: isTapped[index],
                                onTap: onTap,
                              ),
                              SizedBox(width: 15),
                            ],
                          ),
                        ),
                      ),
                      top: mediaQuery.size.height * 0.12,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Text('Loading'),
            );
          }
        },
      ),
    );
  }
}
