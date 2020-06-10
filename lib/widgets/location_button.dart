import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/change_bloc/bloc.dart';

class LocationButton extends StatefulWidget {
  @override
  _LocationButtonState createState() => _LocationButtonState();
}

class _LocationButtonState extends State<LocationButton> {
  final double locationButtonSize = 50;

  bool positionChanged = false;

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
        child: BlocListener<ChangeBloc, ChangeState>(
          listener: (context, state) {
            if (state is MapMovedState) {
              setState(() {
                positionChanged = true;
              });
            } else if (state is MapRefreshed) {
              setState(() {
                positionChanged = false;
              });
            }
          },
          child: Icon(
            Icons.my_location,
            size: 30,
            color: positionChanged ? Colors.grey :Colors.red[300],
          ),
        ),
      ),
    );
  }
}