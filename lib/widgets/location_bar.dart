import 'package:flutter/material.dart';


class LocationBar extends StatelessWidget {
  final placeName;

  const LocationBar(this.placeName);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.location_on,
            color: Colors.blue[900],
          ),
          SizedBox(width: 10),
          placeName == null
              ? CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),
                )
              : Text(placeName),
        ],
      ),
    );
  }
}
