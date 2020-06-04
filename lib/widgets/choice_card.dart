import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/lookup_bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({
    Key key,
    @required this.currentPosition,
    @required this.type,
    @required this.icon,
  }) : super(key: key);

  final LatLng currentPosition;
  final String type;
  final Icon icon;

  void _onTap(String type, BuildContext context) {
    if (type.compareTo('atm') == 0) {
        BlocProvider.of<LookupBloc>(context).add(AtmLookup(
            location: currentPosition, radius: 2000));
    } else if (type.compareTo('pharmacy') == 0) {
        BlocProvider.of<LookupBloc>(context).add(PharmaLookup(
            location: currentPosition, radius: 2000));
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(5),
        child: Row(
          children: <Widget>[
            icon,
            SizedBox(width: 10),
            Text(type.toUpperCase()),
          ],
        ),
      ),
      onTap: () => _onTap(type, context),
    );
  }
}