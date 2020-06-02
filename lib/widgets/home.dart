import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/map_bloc/bloc.dart';
import 'package:flutter_map/widgets/widgets.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                MapView(state.currentPosition),
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
