import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/change_bloc/bloc.dart';

class LocationButton extends StatelessWidget {
  final double locationButtonSize = 50;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<ChangeBloc>(context).add(RefreshMap());
      },
      child: Container(
        height: locationButtonSize,
        width: locationButtonSize,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(locationButtonSize / 2),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(-2, 5),
              spreadRadius: 3,
              blurRadius: 2,
            ),
          ],
        ),
        child: Icon(
          Icons.my_location,
          size: 30,
          color: Colors.red[300],
        ),
      ),
    );
  }
}