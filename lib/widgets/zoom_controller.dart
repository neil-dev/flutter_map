import 'package:flutter/material.dart';
import 'zoom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/change_bloc/bloc.dart';

class ZoomController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(-2, 5),
            spreadRadius: 3,
            blurRadius: 2,
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          ZoomButton(
            icon: Icons.add,
            onTap: () => BlocProvider.of<ChangeBloc>(context).add(ZoomIn()),
          ),
          Container(
            height: 1,
            width: 16,
            color: Colors.black12,
          ),
          ZoomButton(
            icon: Icons.remove,
            onTap: () => BlocProvider.of<ChangeBloc>(context).add(ZoomOut()),
          ),
        ],
      ),
    );
  }
}
