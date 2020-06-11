import 'package:covid19app/config/theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: BarChart(
        BarChartData(
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            leftTitles: SideTitles(showTitles: false),
            bottomTitles: SideTitles(
              showTitles: true,
              getTitles: _getWeekNames,
              textStyle: TextStyle(
                color: TextLightColor,
                fontSize: 12.0,
              ),
            ),
          ),
          barGroups: _getBarGroups(),
        ),
      ),
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    final List<double> barChartData = [6, 10, 8, 7, 10, 15, 9];
    final List<BarChartGroupData> barChartGroups = [];

    barChartData.asMap().forEach((index, value) {
      barChartGroups.add(BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            y: value,
            width: 16.0,
            color: index == 4 ? PrimaryColor : InactiveChartColor,
          )
        ],
      ));
    });

    return barChartGroups;
  }

  String _getWeekNames(double value) {
    switch (value.toInt()) {
      case 0:
        return "SUN";
      case 1:
        return "MON";
      case 2:
        return "TUE";
      case 3:
        return "WED";
      case 4:
        return "THU";
      case 5:
        return "FRI";
      case 6:
        return "SAT";
      default:
        return "";
    }
  }
}
