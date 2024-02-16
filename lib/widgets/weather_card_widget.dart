import 'package:flutter/material.dart';
import 'package:weather_app/app/app_colors.dart';
import 'package:weather_app/app/app_styles.dart';

class WeatherCardWidget extends StatefulWidget {
  final String temp;
  final String type;
  final IconData icon;

  const WeatherCardWidget({
    super.key,
    required this.temp,
    required this.type,
    required this.icon,
  });

  @override
  State<WeatherCardWidget> createState() => _WeatherCardWidgetState();
}

class _WeatherCardWidgetState extends State<WeatherCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: AppColor.bgLight1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.temp,
            style: AppStyle.largeTextStyle,
          ),
          Icon(
            widget.icon,
            color: AppColor.whiteSecondary,
            size: 60,
          ),
          Text(
            widget.type,
            style: AppStyle.mediumTextStyle,
          ),
        ],
      ),
    );
  }
}
