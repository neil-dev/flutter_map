import 'package:equatable/equatable.dart';

class Place extends Equatable {
  final Map<String, double> location;
  final String icon;
  final String id;
  final String name;
  final String type;

  const Place({
    this.location,
    this.icon,
    this.id,
    this.name,
    this.type,
  });

  List<Object> get props => [location, icon, id, name, type];

  static List<Place> fromJson(dynamic json, String type) {
    final List<dynamic> places = json['results'];
    print('Places: $places');
    return places.map((place) {
      print('location: ${place['geometry']['location']}');
      print('icon: ${place['icon']}');
      print('id: ${place['id']}');
      print('name: ${place['name']}');
      return Place(
        location: place['geometry']['location'],
        icon: place['icon'],
        id: place['id'],
        name: place['name'],
        type: type,
      );
    }).toList();
  }
}
