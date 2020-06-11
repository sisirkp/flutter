import 'package:covid19app/config/theme.dart';
import 'package:covid19app/pages/details_page.dart';
import 'package:covid19app/pages/info_card.dart';
import 'package:covid19app/widgets/prevention_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildReportArea(context),
            SizedBox(height: 20.0),
            _buildPreventionArea(context),
            SizedBox(height: 20.0),
            _buildBanner(context),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: PrimaryColor.withOpacity(0.03),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildReportArea(final BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: 20.0,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: PrimaryColor.withOpacity(0.03),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
      ),
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: <Widget>[
          InfoCard(
            title: "Confirmed Cases",
            affectedNumber: 1052,
            iconColor: Color(0xffff9c00),
            callback: (title, affectedNumber) {
              _showDetailsPage(context, title, affectedNumber);
            },
          ),
          InfoCard(
            title: "Total Deaths",
            affectedNumber: 75,
            iconColor: Color(0xffff2d55),
            callback: (title, affectedNumber) {
              _showDetailsPage(context, title, affectedNumber);
            },
          ),
          InfoCard(
            title: "Total Recovered",
            affectedNumber: 689,
            iconColor: Color(0xff50e3c2),
            callback: (title, affectedNumber) {
              _showDetailsPage(context, title, affectedNumber);
            },
          ),
          InfoCard(
            title: "New Cases",
            affectedNumber: 58,
            iconColor: Color(0xff5856d6),
            callback: (title, affectedNumber) {
              _showDetailsPage(context, title, affectedNumber);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPreventionArea(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Preventions",
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              PreventionCard(
                svgSrc: "assets/icons/hand_wash.svg",
                title: "Wash Hands",
              ),
              PreventionCard(
                svgSrc: "assets/icons/use_mask.svg",
                title: "Use Masks",
              ),
              PreventionCard(
                svgSrc: "assets/icons/clean_disinfect.svg",
                title: "Clean Disinfect",
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBanner(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: 150.0,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            Container(
              height: 130.0,
              width: double.infinity,
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.40,
                top: 20,
                right: 20.0,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff60be93),
                    Color(0xff1b8d59),
                  ],
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Dial 108 for\nMedical Help\n",
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: Colors.white),
                    ),
                    TextSpan(
                      text: "If any symptoms appear",
                      style: TextStyle(color: Colors.white.withOpacity(0.7)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SvgPicture.asset("assets/icons/nurse.svg"),
            ),
            Positioned(
              top: 30.0,
              right: 10.0,
              child: SvgPicture.asset("assets/icons/virus.svg"),
            ),
          ],
        ),
      ),
    );
  }

  void _showDetailsPage(final BuildContext context, String title, int affectedNumber) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return DetailsPage(
        title: title,
        affectedNumber: affectedNumber,
      );
    }));
  }
}
