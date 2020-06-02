import 'package:flutter/material.dart';
import 'package:flutter_map/widgets/widgets.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    print('height: ${mediaQuery.size.height}\twidth: ${mediaQuery.size.width}');
    return Scaffold(
      appBar: AppBar(title: Text('Map')),
      body: Column(
        children: <Widget>[
          LocationBar(),
          SizedBox(height: mediaQuery.size.height * 0.015),
          Container(
            child: Text('Home'),
          ),
        ],
      ),
    );
  }
}
