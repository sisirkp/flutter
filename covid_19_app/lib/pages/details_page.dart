import 'package:covid19app/config/theme.dart';
import 'package:covid19app/widgets/weekly_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailsPage extends StatelessWidget {
  final String title;
  final int affectedNumber;

  const DetailsPage({
    this.title,
    this.affectedNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildSummaryArea(context),
              SizedBox(height: 20.0),
              _buildWorldMapChart(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: BackgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: PrimaryColor,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildSummaryArea(final BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.0, 21.0),
            blurRadius: 53.0,
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitleRow(),
          SizedBox(height: 10.0),
          _buildNumbersRow(context),
          SizedBox(height: 10.0),
          Text(
            "From Health Center",
            style: TextStyle(
              color: TextMediumColor,
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0),
          WeeklyChart(),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildInfoText(
                title: "From Last Week",
                percentage: "6.47%",
              ),
              _buildInfoText(
                title: "Recovery Rate",
                percentage: "9.43%",
              ),
            ],
          )
        ],
      ),
    );
  }

  RichText _buildInfoText({String title, String percentage}) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: "$percentage\n",
          style: TextStyle(
            fontSize: 20.0,
            color: PrimaryColor,
          ),
        ),
        TextSpan(
          text: title,
          style: TextStyle(
            color: TextMediumColor,
            height: 1.5,
          ),
        ),
      ]),
    );
  }

  Widget _buildTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: TextMediumColor,
            fontWeight: FontWeight.w600,
            fontSize: 15.0,
          ),
        ),
        SvgPicture.asset("assets/icons/more.svg")
      ],
    );
  }

  Widget _buildNumbersRow(final BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "$affectedNumber ",
          style: Theme.of(context)
              .textTheme
              .display3
              .copyWith(color: PrimaryColor, height: 1.2),
        ),
        Text(
          "5.9% ",
          style: TextStyle(
            color: PrimaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        SvgPicture.asset("assets/icons/increase.svg")
      ],
    );
  }

  Widget _buildWorldMapChart() {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.0, 21.0),
            blurRadius: 54.0,
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Global Map",
                style: TextStyle(fontSize: 15.0),
              ),
              SvgPicture.asset("assets/icons/more.svg"),
            ],
          ),
          SizedBox(height: 15.0),
          SvgPicture.asset("assets/icons/map.svg"),
        ],
      ),
    );
  }
}
