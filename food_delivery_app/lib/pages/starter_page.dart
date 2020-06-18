import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/animations/fade_animation.dart';
import 'package:fooddeliveryapp/pages/home_page.dart';
import 'package:page_transition/page_transition.dart';

class StarterPage extends StatefulWidget {
  @override
  _StarterPageState createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  bool _isTextVisible = true;

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );

    _animation = Tween<double>(
      begin: 1.0,
      end: 25.0,
    ).animate(_animationController);
  }

  void _onStartPressed() {
    setState(() => _isTextVisible = false);
    _animationController.forward().then((_) {
      return Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/starter-image.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.2),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadeAnimation(
                delay: 0.5,
                child: Text(
                  "Taking Order For Delivery",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              FadeAnimation(
                delay: 1.0,
                child: Text(
                  "See nearby restaurants by adding your location",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    height: 1.4,
                  ),
                ),
              ),
              SizedBox(height: 100.0),
              FadeAnimation(
                delay: 1.2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    gradient: LinearGradient(
                      colors: [
                        Colors.yellow,
                        Colors.orange,
                      ],
                    ),
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    child: Text(
                      "Start",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: _onStartPressed,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              FadeAnimation(
                delay: 1.4,
                child: Center(
                  child: Text(
                    "Now delivery to your room 24/7",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
