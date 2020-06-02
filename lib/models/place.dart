import 'package:equatable/equatable.dart';

class Place extends Equatable {
  final Map<String, int> location;
  final String icon;
  final String id;
  final String name;

  const Place({
    this.location,
    this.icon,
    this.id,
    this.name,
  });

  List<Object> get props => [location, icon, id, name];

  static List<Place> fromJson(dynamic json, String type) {
    final List<dynamic> places = json['results'];
    return places
        .map((place) => Place(
              location: place['geometry']['location'],
              icon: place['icon'],
              id: place['id'],
              name: place['name'],
            ))
        .toList();
  }
}
