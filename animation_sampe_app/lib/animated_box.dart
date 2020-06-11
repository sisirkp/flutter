import 'package:flutter/material.dart';

class AnimatedBox extends StatefulWidget {
  @override
  _AnimatedBoxState createState() => _AnimatedBoxState();
}

class _AnimatedBoxState extends State<AnimatedBox>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _colorAnimation;
  Animation _sizeAnimation;
  int timerTick = 0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    _colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.yellow).animate(_controller);
    _sizeAnimation =
        Tween<double>(begin: 100.0, end: 200.0).animate(_controller);
    _controller.addListener(() => setState(() => timerTick++));
    _controller.addStatusListener(animationStatusListener);
    _controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Demo"),
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          final size = _sizeAnimation.value;
          return Center(
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(size / 2),
                ),
                color: _colorAnimation.value,
              ),
            ),
          );
        },
      ),
    );
  }

  void animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      _controller.forward();
    }
  }
}
