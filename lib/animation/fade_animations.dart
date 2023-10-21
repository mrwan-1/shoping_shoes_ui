import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

import 'dart:async';

class FadeAnimation extends StatefulWidget {
  const FadeAnimation({Key? key, required this.delay, required this.child})
      : super(key: key);
  final double delay;
  final Widget child;

  @override
  _FadeAnimationState createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationOpacity;
  late Animation<double> _animationTranslation;

  bool _disposed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: 500.milliseconds,
      value: 0,
      reverseDuration: 500.milliseconds,
    );

    final opacityTween = (0.0).tweenTo(1.0);
    final translationTween = (-30.0).tweenTo(0.0);

    _animationOpacity = opacityTween.animate(_controller);
    _animationTranslation = translationTween.animate(_controller);

    Future.delayed(Duration(milliseconds: (100 * widget.delay).round()), () {
      if (!_disposed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _disposed = true;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _animationOpacity.value,
          child: Transform.translate(
            offset: Offset(0, _animationTranslation.value),
            child: widget.child,
          ),
        );
      },
    );
  }
}
