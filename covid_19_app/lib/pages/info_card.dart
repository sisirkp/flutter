import 'package:covid19app/config/theme.dart';
import 'package:covid19app/pages/line_report_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final int affectedNumber;
  final Color iconColor;
  final Function callback;

  const InfoCard({
    Key key,
    this.title,
    this.affectedNumber,
    this.iconColor,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return InkWell(
        onTap: () => callback(title, affectedNumber),
        child: Container(
          width: constraints.maxWidth / 2 - 10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 30.0,
                      height: 30.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: iconColor.withOpacity(0.12),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/running.svg",
                        width: 12.0,
                        height: 12.0,
                        color: iconColor,
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Container(
                      width: 80.0,
                      child: Text(
                        title,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: TextColor),
                          children: [
                            TextSpan(
                              text: "$affectedNumber \n",
                              style: Theme.of(context)
                                  .textTheme
                                  .title
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: "People",
                              style: TextStyle(fontSize: 12.0, height: 2.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: LinearReportChart()),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
