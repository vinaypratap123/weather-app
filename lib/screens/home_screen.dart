import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/app/app_colors.dart';
import 'package:weather_app/app/app_strings.dart';
import 'package:weather_app/app/app_styles.dart';
import 'package:weather_app/widgets/additional_info_card_widget.dart';
import 'package:weather_app/widgets/hourly_forecast_card_widget.dart';
import 'package:weather_app/widgets/weather_card_widget.dart';

import '../app/utils/data_time_utils.dart';

class HomeScreen extends StatefulWidget {
  final String? country;
  const HomeScreen({super.key, required this.country});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ********************** initState() method **********************
  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  // ********************** getCurrentWeather() method **********************
  Future<Map<String, dynamic>?> getCurrentWeather() async {
    try {
      final result = await http.get(
        Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=${widget.country}&APPID=bf251b13fcf2688e88f9d6ed4849806a",
        ),
      );
      final data = jsonDecode(result.body);
      if (data["cod"] != "200") {
        throw "unexpected error ${data['cod']}";
      }

      if (kDebugMode) {
        print(result.body.toString());
      }
      return data;
    } catch (error) {
      throw error.toString();
    }
  }

  // ********************** build() method **********************
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.bgLight1,
        title: Text(
          "${AppString.weatherApp}       (${widget.country})",
          style: AppStyle.mediumTextStyle,
        ),
        actions: [
// ******************************** refresh button *********************************
          IconButton(
            onPressed: () {
              setState(() {});
              getCurrentWeather();
            },
            icon: const Icon(
              Icons.refresh,
              color: AppColor.whiteSecondary,
            ),
          ),
        ],
      ),
      backgroundColor: AppColor.scaffoldBg,
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
// ******************************** waiting state *********************************
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.whiteSecondary,
              ),
            );
          }
// ******************************** error state *********************************
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }
          final data = snapshot.data!;
          final temp = data['list'][0]['main']['temp'];
          final sky = data['list'][0]['weather'][0]['main'];
          final pressure = data['list'][0]['main']['pressure'];
          final humidity = data['list'][0]['main']['humidity'];
          final windSpeed = data['list'][0]['wind']['speed'];

          return SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
// ******************************** weather forecast *********************************
                  SizedBox(
                    height: 200,
                    width: width,
                    child: WeatherCardWidget(
                      temp: temp.toString(),
                      type: sky,
                      icon: sky == "Clouds" || sky == "Rain"
                          ? Icons.cloud
                          : Icons.sunny,
                    ),
                  ),
// ******************************** hourly forecast *********************************
                  const Gap(20),
                  const Text(
                    AppString.hourlyForecast,
                    style: AppStyle.largeTextStyle,
                  ),
                  const Gap(20),
                  SizedBox(
                    height: 140,
                    width: width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        final hourlyForecast = data['list'][index + 1];
                        final hourlySky = hourlyForecast['weather'][0]['main'];
                        final hourlyTemp =
                            hourlyForecast['main']['temp'].toString();
                        final time =
                            DateTime.parse(hourlyForecast['dt_txt'].toString());
                        return HourlyForecastCardWidget(
                          icon: hourlySky == "Clouds" || hourlySky == "Rain"
                              ? Icons.cloud
                              : Icons.sunny,
                          time: DateTimeUtil.formatTime(time),
                          temp: hourlyTemp,
                        );
                      },
                    ),
                  ),
// ******************************** additional forecast *********************************
                  const Gap(20),
                  const Text(
                    AppString.additionalInformation,
                    style: AppStyle.largeTextStyle,
                  ),
                  const Gap(10),
                  SizedBox(
                    height: 120,
                    width: width,
                    child: Row(
                      children: [
                        AdditionalInfoCardWidget(
                          infoName: AppString.humidity,
                          infoValue: humidity.toString(),
                          icon: Icons.water_drop_outlined,
                        ),
                        AdditionalInfoCardWidget(
                          infoName: AppString.windSpeed,
                          infoValue: windSpeed.toString(),
                          icon: Icons.air,
                        ),
                        AdditionalInfoCardWidget(
                          infoName: AppString.pressure,
                          infoValue: pressure.toString(),
                          icon: Icons.beach_access,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
