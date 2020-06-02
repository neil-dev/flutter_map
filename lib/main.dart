import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/simple_bloc_delegate.dart';
import 'package:flutter_map/repositories/repositories.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_map/widgets/widgets.dart';
import 'package:flutter_map/map_bloc/bloc.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final PlaceRepository placeRepository = PlaceRepository(
    apiClient: ApiClient(
      httpClient: http.Client(),
    ),
  );
  runApp(
    MyApp(
      placeRepository: placeRepository,
    ),
  );
}

class MyApp extends StatelessWidget {
  final PlaceRepository placeRepository;

  MyApp({Key key, @required this.placeRepository})
      : assert(placeRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Maps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => MapBloc(placeRepository: placeRepository)..add(AppStarted()),
        child: Home(),
      ),
    );
  }
}
