import 'package:flutter/material.dart';

class ZoomButton extends StatelessWidget {
  const ZoomButton({
    Key key,
    @required this.icon,
    @required this.isTapped,
  }) : super(key: key);

  
  final double buttonHeight = 35;
  final IconData icon;
  final bool isTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isTapped ? Colors.red[300] : Colors.white,
      width: double.infinity,
      height: buttonHeight,
      child: Icon(
        icon,
        color: isTapped ? Colors.white : Colors.red[300],
      ),
    );
  }
}
