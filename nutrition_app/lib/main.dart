import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nutrition App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff21BFBD),
      body: ListView(
        children: <Widget>[
          _buildTopRow(),
          SizedBox(height: 25.0),
          _buildTitleText(),
          SizedBox(height: 40.0),
          _buildFoodsList(),
        ],
      ),
    );
  }

  static Widget _buildTopRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {},
          ),
          Container(
            width: 125.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.filter_list),
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  static Widget _buildTitleText() {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: Row(
        children: <Widget>[
          Text(
            "Healthy",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                fontSize: 25.0),
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            "Food",
            style: TextStyle(
                color: Colors.white, fontFamily: "Montserrat", fontSize: 25.0),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodsList() {
    return Container(
      height: MediaQuery.of(context).size.height - 185.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
      ),
      child: ListView(
        primary: false,
        padding: EdgeInsets.only(left: 25.0, right: 20.0),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 45.0),
            child: Container(
              height: MediaQuery.of(context).size.height - 300,
              child: ListView(
                children: <Widget>[
                  _buildFoodItem(
                    "assets/images/plate1.png",
                    "Salmon Bowl",
                    "\$24.00",
                  ),
                  _buildFoodItem(
                    "assets/images/plate2.png",
                    "Spring Bowl",
                    "\$20.00",
                  ),
                  _buildFoodItem(
                    "assets/images/plate3.png",
                    "Avocado Bowl",
                    "\$34.00",
                  ),
                  _buildFoodItem(
                    "assets/images/plate4.png",
                    "Berry Bowl",
                    "\$14.00",
                  ),
                  _buildFoodItem(
                    "assets/images/plate4.png",
                    "Berry Bowl",
                    "\$14.00",
                  ),
                  _buildFoodItem(
                    "assets/images/plate4.png",
                    "Berry Bowl",
                    "\$14.00",
                  ),
                ],
              ),
            ),
          ),
          _buildCheckoutButtonsRow(),
        ],
      ),
    );
  }

  Widget _buildFoodItem(String imagePath, String foodName, String price) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Hero(
              tag: imagePath,
              child: Image(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                height: 75.0,
                width: 75.0,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  foodName,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(width: 40.0),
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.black,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCheckoutButtonsRow() {
    double parentWidth = MediaQuery.of(context).size.width - 20.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          height: 65.0,
          width: parentWidth/3 - 40.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              style: BorderStyle.solid,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
        ),
        Container(
          height: 65.0,
          width: parentWidth/3 - 40.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              style: BorderStyle.solid,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: Icon(
              Icons.shopping_basket,
              color: Colors.grey,
            ),
          ),
        ),
        Container(
          height: 65.0,
          width: parentWidth/3 + 30.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              style: BorderStyle.solid,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(15.0),
            color: Color(0xff180435)
          ),
          child: Center(
            child: Text(
              "Checkout",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 17.0,
                color: Colors.white
              ),
            ),
          ),
        ),
      ],
    );
  }
}
