import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/lookup_bloc/bloc.dart';
import 'package:flutter_map/map_bloc/bloc.dart';
import 'package:flutter_map/widgets/widgets.dart';
import 'package:flutter_map/repositories/repositories.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
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
            return Container(
              child: BlocProvider(
                create: (context) =>
                    LookupBloc(placeRepository: placeRepository),
                child: Stack(
                  children: <Widget>[
                    MapViewer(state.currentPosition),
                    Positioned(
                      child: LocationBar(state.placeName),
                      top: mediaQuery.size.height * 0.02,
                      left: mediaQuery.size.width * 0.03,
                    ),
                    Positioned(
                      width: mediaQuery.size.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          ChoiceCard(
                            currentPosition: state.currentPosition,
                            type: 'atm',
                            icon: Icon(Icons.atm),
                          ),
                          ChoiceCard(
                            currentPosition: state.currentPosition,
                            type: 'pharmacy',
                            icon: Icon(Icons.local_pharmacy),
                          ),
                        ],
                      ),
                      top: mediaQuery.size.height * 0.08,
                      left: mediaQuery.size.width * 0.03,
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
