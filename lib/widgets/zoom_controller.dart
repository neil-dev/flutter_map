import 'package:flutter/material.dart';
import 'zoom_button.dart';

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
          ),
          Container(
            height: 1,
            width: 16,
            color: Colors.black12,
          ),
          ZoomButton(
            icon: Icons.remove,
          ),
        ],
      ),
    );
  }
}
