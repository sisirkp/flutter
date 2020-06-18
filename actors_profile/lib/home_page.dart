import 'package:actorsprofile/animations/fade_animation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Stack(
          children: <Widget>[
            CustomScrollView(
              slivers: <Widget>[
                _buildMainImage(),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _buildDescription(),
                          const SizedBox(height: 40.0),
                          _buildDetails("Born", "April 15 1990, Paris, France"),
                          const SizedBox(height: 20.0),
                          _buildDetails("Nationality", "British"),
                          const SizedBox(height: 20.0),
                          _buildVideos(),
                          const SizedBox(height: 80.0),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            Positioned.fill(
              bottom: 20.0,
              child: Align(
                alignment: Alignment.bottomRight,
                child: _buildButton(),
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildMainImage() {
    return SliverAppBar(
      expandedHeight: 400.0,
      backgroundColor: Colors.black12,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/emma.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                colors: [
                  Colors.black,
                  Colors.black.withOpacity(0.3),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeAnimation(
                  delay: 1.0,
                  child: Text(
                    "Emma Watson",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FadeAnimation(
                      delay: 1.2,
                      child: Text(
                        "60 Videos",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    FadeAnimation(
                      delay: 1.2,
                      child: Text(
                        "240K Subscribers",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FadeAnimation _buildDescription() {
    return FadeAnimation(
      delay: 1.6,
      child: Text(
        "Emma Charlotte Duerre Watson is an English actress, model, and activist. Born in Paris and brought up in Oxfordshire, Watson attended the Dragon School and trained as an actress at the Oxford branch of Stagecoach Theatre Arts. As a child, she rose to prominence with her first professional acting role as Hermione Granger in the Harry Potter film series, having acted only in school plays previously.",
        style: TextStyle(
          color: Colors.grey,
          height: 1.4,
          fontSize: 16.0,
        ),
      ),
    );
  }

  FadeAnimation _buildDetails(String title, String description) {
    return FadeAnimation(
      delay: 1.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            description,
            style: TextStyle(
              color: Colors.grey,
              height: 1.4,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FadeAnimation(
          delay: 1.6,
          child: Text(
            "Videos",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        FadeAnimation(
          delay: 1.8,
          child: Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildVideo(image: "assets/images/emma-1.jpg"),
                _buildVideo(image: "assets/images/emma-2.jpg"),
                _buildVideo(image: "assets/images/emma-3.jpg"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVideo({String image}) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Container(
        margin: EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            image: AssetImage(image),
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
                Colors.black.withOpacity(0.3),
              ],
            ),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 70.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton() {
    return FadeAnimation(
      delay: 2.0,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.yellow[700],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            "Follow",
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
