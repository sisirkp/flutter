import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/animations/fade_animation.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        brightness: Brightness.light,
        leading: Icon(null),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.fastfood,
              color: Colors.black54,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeAnimation(
              delay: 1.0,
              child: Text(
                "Food Delivery",
                style: TextStyle(
                  color: Colors.grey[80],
                  fontSize: 38.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              height: 50.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  FadeAnimation(
                    delay: 1.0,
                    child: _buildCategory(isActive: true, title: 'Pizza'),
                  ),
                  FadeAnimation(
                    delay: 1.3,
                    child: _buildCategory(isActive: false, title: 'Burger'),
                  ),
                  FadeAnimation(
                    delay: 1.4,
                    child: _buildCategory(isActive: false, title: 'Kebab'),
                  ),
                  FadeAnimation(
                    delay: 1.5,
                    child: _buildCategory(isActive: false, title: 'Desert'),
                  ),
                  FadeAnimation(
                    delay: 1.6,
                    child: _buildCategory(isActive: false, title: 'Salad'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            FadeAnimation(
              delay: 1.0,
              child: Text(
                "Free Delivery",
                style: TextStyle(
                  color: Colors.grey[80],
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  FadeAnimation(
                    delay: 1.4,
                    child: _buildFoodImage(image: "assets/images/one.jpg"),
                  ),
                  FadeAnimation(
                    delay: 1.5,
                    child: _buildFoodImage(image: "assets/images/two.jpg"),
                  ),
                  FadeAnimation(
                    delay: 1.6,
                    child: _buildFoodImage(image: "assets/images/three.jpg"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCategory({bool isActive, String title}) {
    return AspectRatio(
      aspectRatio: isActive ? 3 : 2 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          color: isActive ? Colors.yellow[700] : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        child: Align(
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.grey[500],
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFoodImage({String image}) {
    return AspectRatio(
      aspectRatio: 1 / 1.5,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.only(right: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 10.0,
              top: 10.0,
              bottom: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                stops: [0.2, 0.9],
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.3),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite, color: Colors.white),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "₹ 185.0",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Vegetarian Pizza",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
