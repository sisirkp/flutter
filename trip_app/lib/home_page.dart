import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tripapp/fade_animation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  int totalPages = 4;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0)..addListener(onPageScroll);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          _buildPage(
            1,
            "assets/images/one.jpg",
            "Yosemite National Park",
            "Yosemite National Park is an American national park located in the western Sierra Nevada of Central California, bounded on the southeast by Sierra National Forest and on the northwest by Stanislaus National Forest. The park is managed by the National Park Service and covers an area of 748,436 acres (1,169 sq mi; 3,029 km2) and sits in four counties: centered in Tuolumne and Mariposa, extending north and east to Mono and south to Madera County.",
            4,
          ),
          _buildPage(
            2,
            "assets/images/two.jpg",
            "Golden Gate Bridge",
            "The Golden Gate Bridge is a suspension bridge spanning the Golden Gate, the one-mile-wide strait connecting San Francisco Bay and the Pacific Ocean",
            3,
          ),
          _buildPage(
            3,
            "assets/images/three.jpg",
            "Sedona",
            "Sedona is a city that straddles the county line between Coconino and Yavapai counties in the northern Verde Valley region of the U.S. state of Arizona.",
            5,
          ),
          _buildPage(
            4,
            "assets/images/four.jpg",
            "Savannah",
            "Savannah is the oldest city in the U.S. state of Georgia and is the county seat of Chatham County. Established in 1733 on the Savannah River, the city of Savannah became the British colonial capital of the Province of Georgia and later the first state capital of Georgia.",
            3,
          ),
        ],
      ),
    );
  }

  Widget _buildPage(
    int pageIndex,
    String imageUrl,
    String title,
    String description,
    int rating,
  ) {
    const maxRating = 5;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            imageUrl,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 40.0,
          bottom: 20.0,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: [0.3, 0.9],
            colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.2),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(
                  pageIndex.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "/$totalPages",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeAnimation(
                  delay: 1.0,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                FadeAnimation(delay: 1.5, child: _buildStarRating(maxRating, rating)),
                SizedBox(height: 20.0),
                FadeAnimation(
                  delay: 2.0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: Text(
                      description,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                        height: 1.5,
                      ),
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                FadeAnimation(
                  delay: 2.5,
                  child: Text(
                    "Read More",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStarRating(int maxRating, int currentRating) {
    final List<Widget> stars = [];
    for (int i = 0; i < maxRating; i++) {
      final starColor = i < currentRating ? Colors.yellow : Colors.grey;
      stars.add(
        Container(
          child: Icon(
            Icons.star,
            color: starColor,
            size: 15.0,
          ),
        ),
      );
    }

    stars.add(SizedBox(width: 5.0));
    stars.add(
      Text(
        currentRating.toDouble().toString(),
        style: TextStyle(color: Colors.white70),
      ),
    );
    stars.add(SizedBox(width: 5.0));
    stars.add(
      Text(
        "(3400)",
        style: TextStyle(color: Colors.white70),
      ),
    );
    return Row(children: stars);
  }

  void onPageScroll() {}
}
