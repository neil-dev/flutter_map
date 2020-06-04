import 'package:equatable/equatable.dart';

class Place extends Equatable {
  final Map<String, dynamic> location;
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
    print('Places: ${places.length}');
    return places.map((place) {
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
