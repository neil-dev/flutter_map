import 'package:flutter/material.dart';


class LocationBar extends StatelessWidget {
  final placeName;

  const LocationBar(this.placeName);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.1),
      padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.05),
      // width: mediaQuery.size.width * 0.8,
      color: Colors.white,
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
