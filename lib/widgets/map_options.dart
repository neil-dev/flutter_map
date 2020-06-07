import 'package:flutter/material.dart';
import 'package:flutter_map/widgets/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/lookup_bloc/bloc.dart';

class MapOptions extends StatefulWidget {
  const MapOptions({
    Key key,
    @required this.currentPosition,
  }) : super(key: key);

  final LatLng currentPosition;


  @override
  _MapOptionsState createState() => _MapOptionsState();
}

class _MapOptionsState extends State<MapOptions> {
  List<bool> isTapped = [false, false, false, false];

  void onTap(
      LatLng currentPosition, String type, BuildContext context, int id) {
    setState(() {
      for (int i = 0; i < isTapped.length; i++) {
        isTapped[i] = false;
      }
      isTapped[id] = true;
    });
    if (type.compareTo('atm') == 0) {
      BlocProvider.of<LookupBloc>(context)
          .add(AtmLookup(location: currentPosition, radius: 2000));
    } else if (type.compareTo('pharmacy') == 0) {
      BlocProvider.of<LookupBloc>(context)
          .add(PharmaLookup(location: currentPosition, radius: 2000));
    } else if (type.compareTo('restaurant') == 0) {
      BlocProvider.of<LookupBloc>(context)
          .add(RestaurantLookup(location: currentPosition, radius: 2000));
    } else if (type.compareTo('hospital') == 0) {
      BlocProvider.of<LookupBloc>(context)
          .add(HospitalLookup(location: currentPosition, radius: 2000));
    }
  }
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Positioned(
      child: Container(
        width: mediaQuery.size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              SizedBox(width: 15),
              ChoiceCard(
                currentPosition: widget.currentPosition,
                type: 'atm',
                icon: Icons.atm,
                id: 0,
                isTapped:isTapped[0],
                onTap: onTap,
              ),
              SizedBox(width: 20),
              ChoiceCard(
                currentPosition: widget.currentPosition,
                type: 'pharmacy',
                icon: Icons.local_pharmacy,
                id: 1,
                isTapped: isTapped[1],
                onTap: onTap,
              ),
              SizedBox(width: 20),
              ChoiceCard(
                currentPosition: widget.currentPosition,
                type: 'restaurant',
                icon: Icons.restaurant,
                id: 2,
                isTapped: isTapped[2],
                onTap: onTap,
              ),
              SizedBox(width: 20),
              ChoiceCard(
                currentPosition: widget.currentPosition,
                type: 'hospital',
                icon: Icons.restaurant,
                id: 3,
                isTapped: isTapped[3],
                onTap: onTap,
              ),
              SizedBox(width: 15),
            ],
          ),
        ),
      ),
      top: mediaQuery.size.height * 0.15,
    );
  }
}