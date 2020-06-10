import 'package:flutter/material.dart';

class ZoomButton extends StatefulWidget {
  const ZoomButton({
    Key key,
    @required this.icon,
    @required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final Function onTap;

  @override
  _ZoomButtonState createState() => _ZoomButtonState();
}

class _ZoomButtonState extends State<ZoomButton> with TickerProviderStateMixin {
  final double buttonHeight = 35;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  void _onTap() {
    _controller.reset();
    _controller.forward();
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        double value = _controller.value;
        return InkWell(
          onTap: _onTap,
          child: Container(
            decoration: BoxDecoration(
              color:
                  value > 0.2 && value < 0.8 ? Colors.red[300] : Colors.white,
              boxShadow: value > 0.2 && value < 0.8
                  ? [
                      BoxShadow(
                        color: Colors.white70,
                        offset: Offset(-2, 5),
                        spreadRadius: 3,
                        blurRadius: 2,
                      ),
                    ]
                  : [],
            ),
            width: double.infinity,
            height: buttonHeight,
            child: Icon(
              widget.icon,
              color:
                  value > 0.2 && value < 0.8 ? Colors.white : Colors.red[300],
            ),
          ),
        );
      },
    );
  }
}
