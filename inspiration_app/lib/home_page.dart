import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 243, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black87,
          ),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildSearchSection(),
              _buildPromoSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchSection() {
    return Container(
      padding: EdgeInsets.all(20.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Find Your",
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 3.0),
          Text(
            "Inspiration",
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 25.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Color.fromRGBO(244, 243, 243, 1),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black87,
                ),
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }

  Widget _buildPromoSection() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Promo Today",
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildPromoCards("assets/images/one.jpg"),
                _buildPromoCards("assets/images/two.jpg"),
                _buildPromoCards("assets/images/three.jpg"),
                _buildPromoCards("assets/images/four.jpg"),
              ],
            ),
          ),
          SizedBox(height: 15.0),
          _buildBottomRow("assets/images/three.jpg"),
        ],
      ),
    );
  }

  Widget _buildPromoCards(String imageUrl) {
    return AspectRatio(
      aspectRatio: 2.5 / 3,
      child: Container(
        margin: EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              stops: [0.2, 0.9],
              colors: [
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomRow(String imageUrl) {
    return Container(
      height: 140.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: [0.3, 0.9],
            colors: [
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.2),
            ],
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Best Design",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
