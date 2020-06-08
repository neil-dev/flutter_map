import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChoiceCard extends StatelessWidget {
  ChoiceCard({
    @required this.currentPosition,
    @required this.type,
    @required this.icon,
    @required this.onTap,
    @required this.isTapped,
    @required this.id,
  }) ;

  final LatLng currentPosition;
  final String type;
  final IconData icon;
  final Function onTap;
  final bool isTapped;
  final int id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isTapped ? Colors.red[300] : Colors.white,
          boxShadow: isTapped ? [] : [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(-2, 5),
              spreadRadius: 3,
              blurRadius: 2,
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: isTapped ? Colors.white : Colors.red[400],
              size: 20,
            ),
            SizedBox(width: 10),
            Text(
              type.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                color: isTapped ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
      onTap: () => onTap(currentPosition, type, context, id),
    );
  }
}
