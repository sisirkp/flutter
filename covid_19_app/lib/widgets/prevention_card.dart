import 'package:covid19app/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PreventionCard extends StatelessWidget {
  final String svgSrc;
  final String title;

  const PreventionCard({
    Key key,
    this.svgSrc,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset(svgSrc),
        SizedBox(height: 5.0),
        Text(
          title,
          style:
          Theme.of(context).textTheme.body2.copyWith(color: PrimaryColor),
        )
      ],
    );
  }
}
