import 'package:flutter/material.dart';
import 'package:weather_app/app/app_colors.dart';
import 'package:weather_app/app/app_styles.dart';

class HourlyForecastCardWidget extends StatefulWidget {
  final String time;
  final String temp;
  final IconData icon;
  const HourlyForecastCardWidget({
    super.key,
    required this.time,
    required this.temp,
    required this.icon,
  });

  @override
  State<HourlyForecastCardWidget> createState() =>
      _HourlyForecastCardWidgetState();
}

class _HourlyForecastCardWidgetState extends State<HourlyForecastCardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Card(
        elevation: 5,
        color: AppColor.bgLight1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.time,
              style: AppStyle.mediumBodyStyle,
            ),
            Icon(
              widget.icon,
              color: AppColor.whiteSecondary,
              size: 30,
            ),
            Text(
              widget.temp,
              style: AppStyle.smallBodyStyle,
            ),
          ],
        ),
      ),
    );
  }
}
