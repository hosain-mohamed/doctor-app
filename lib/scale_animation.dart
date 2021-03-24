import 'package:flutter/material.dart';

class ScaleAnimation extends StatefulWidget {
  final Duration duration;
  final Widget child;
  final bool startAnimation;
  const ScaleAnimation({
    Key key,
    this.duration,
    @required this.child,
    @required this.startAnimation,
  }) : super(key: key);
  @override
  _ScaleAnimationState createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 1, end: widget.startAnimation ? 10 : 1),
        duration: widget.duration ?? Duration(milliseconds: 500),
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: widget.child,
          );
        });
  }
}
