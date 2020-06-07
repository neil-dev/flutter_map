import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/lookup_bloc/bloc.dart';
import 'package:flutter_map/map_bloc/bloc.dart';
import 'package:flutter_map/widgets/widgets.dart';
import 'package:flutter_map/repositories/repositories.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  

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
      // appBar: AppBar(title: Text('Map')),
      
      body: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          if (state is MapLoaded) {
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
                      top: mediaQuery.size.height * 0.05,
                    ),
                    MapOptions(currentPosition: state.currentPosition),
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


