import 'package:flutter/material.dart';

//Animate text from cetain percent to the other
class AnimatedTextPercent extends StatefulWidget {
  final double fromValue;
  final double toValue;
  final Duration duration;

  AnimatedTextPercent({this.fromValue, this.toValue, this.duration});

  @override
  State<StatefulWidget> createState() => _AnimatedPercentageWidgetState();
}

class _AnimatedPercentageWidgetState extends State<AnimatedTextPercent>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  String _number;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _animation = Tween<double>(begin: widget.fromValue, end: widget.toValue)
        .animate(_controller)
          ..addListener(() {
            setState(() {
              _number = _animation.value.toStringAsFixed(0);
            });
          });
    _controller.forward();
  }

  @override
  Future<void> dispose() async {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      Text("$_number%", style: Theme.of(context).textTheme.title);
}
