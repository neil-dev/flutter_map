import 'package:flutter/material.dart';

class LocationBar extends StatelessWidget {
  final placeName;

  const LocationBar(this.placeName);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    print('${mediaQuery.size.height}\t${mediaQuery.size.width}');
    return Container(
      margin: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.1),
      padding: EdgeInsets.symmetric(
        horizontal: mediaQuery.size.width * 0.05,
        vertical: mediaQuery.size.height * 0.015,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(-4, 5),
            spreadRadius: 4,
            blurRadius: 5,
          )
        ],
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.location_on,
            color: Colors.red[300],
            size: 24,
          ),
          SizedBox(width: 20),
          placeName == null
              ? CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),
                )
              : Text(
                  placeName,
                  style: TextStyle(fontSize: 18, color: Colors.grey[400]),
                  overflow: TextOverflow.ellipsis,
                ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
