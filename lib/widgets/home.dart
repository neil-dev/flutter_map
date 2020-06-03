import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/lookup_bloc/bloc.dart';
import 'package:flutter_map/map_bloc/bloc.dart';
import 'package:flutter_map/models/key.dart';
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
    ApiKey k;
    if (k == null)
      print('null');
    // print('${k.getKey}');
    final mediaQuery = MediaQuery.of(context);
    print('height: ${mediaQuery.size.height}\twidth: ${mediaQuery.size.width}');
    return Scaffold(
      appBar: AppBar(title: Text('Map')),
      body: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          if (state is MapLoaded) {
            return Column(
              children: <Widget>[
                SizedBox(height: mediaQuery.size.height * 0.015),
                LocationBar(state.placeName),
                SizedBox(height: mediaQuery.size.height * 0.015),
                BlocProvider(create: (context) => LookupBloc(placeRepository: placeRepository),child: MapViewer(state.currentPosition),),
                
              ],
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
