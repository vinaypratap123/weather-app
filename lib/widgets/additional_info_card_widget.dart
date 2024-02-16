import 'package:flutter/material.dart';
import 'package:weather_app/app/app_colors.dart';
import 'package:weather_app/app/app_styles.dart';

class AdditionalInfoCardWidget extends StatefulWidget {
  final String infoName;
  final String infoValue;
  final IconData icon;

  const AdditionalInfoCardWidget({
    super.key,
    required this.infoName,
    required this.infoValue,
    required this.icon,
  });

  @override
  State<AdditionalInfoCardWidget> createState() =>
      _AdditionalInfoCardWidgetState();
}

class _AdditionalInfoCardWidgetState extends State<AdditionalInfoCardWidget> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.transparent,
      width: width * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            widget.icon,
            color: AppColor.whiteSecondary,
            size: 30,
          ),
          Text(
            widget.infoName,
            style: AppStyle.smallBodyStyle,
          ),
          Text(
            widget.infoValue,
            style: AppStyle.mediumBodyStyle,
          ),
        ],
      ),
    );
  }
}
