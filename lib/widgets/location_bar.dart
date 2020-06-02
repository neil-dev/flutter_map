import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/map_bloc/bloc.dart';

class LocationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(builder: (context, state) {
      if (state is MapLoaded) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: Colors.blue[900],
              ),
              SizedBox(width: 10),
              Text(state.placeName),
            ],
          ),
        );
      } else {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: Colors.blue[900],
              ),
              SizedBox(width: 10),
              CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),
              ),
            ],
          ),
        );
      }
    });
  }
}
