import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/app/app_colors.dart';
import 'package:weather_app/app/app_strings.dart';
import 'package:weather_app/app/app_styles.dart';
import 'package:weather_app/screens/home_screen.dart';

class CountryPickerScreen extends StatefulWidget {
  const CountryPickerScreen({super.key});

  @override
  State<CountryPickerScreen> createState() => _CountryPickerScreenState();
}

class _CountryPickerScreenState extends State<CountryPickerScreen> {
  // Initial Selected Value
  String country = 'India';

  // List of country
  var countries = [
    'United States of America',
    'Canada',
    'United Kingdom',
    'Germany',
    'France',
    'Italy',
    'Spain',
    'Australia',
    'Japan',
    'China',
    'Brazil',
    'Mexico',
    'India',
    'Russia',
    'South Korea',
    'Argentina',
    'Indonesia',
    'Turkey',
    'Saudi Arabia',
    'South Africa',
    'Nigeria',
    'Egypt',
    'Pakistan',
    'Bangladesh',
    'Iran',
    'Iraq',
    'Afghanistan',
    'Colombia',
    'Philippines',
    'Vietnam',
    'Thailand',
    'Malaysia',
    'Singapore',
    'United Arab Emirates',
    'Qatar',
    'Kuwait',
    'Oman',
    'Yemen',
    'Chile',
    'Peru',
    'Venezuela',
    'Ecuador',
    'Bolivia',
    'Paraguay',
    'Uruguay',
    'New Zealand',
    'Switzerland',
    'Netherlands',
    'Belgium',
    'Sweden',
    'Norway',
    'Denmark',
    'Finland',
    'Austria',
    'Portugal',
    'Greece',
    'Hungary',
    'Poland',
    'Czech Republic',
    'Slovakia',
    'Romania',
    'Bulgaria',
    'Croatia',
    'Serbia',
    'Slovenia',
    'Bosnia and Herzegovina',
    'Montenegro',
    'North Macedonia',
    'Albania',
    'Kosovo',
    'Belarus',
    'Ukraine',
    'Moldova',
    'Georgia',
    'Armenia',
    'Azerbaijan',
    'Kazakhstan',
    'Uzbekistan',
    'Turkmenistan',
    'Kyrgyzstan',
    'Tajikistan',
    'Mongolia',
    'Myanmar (Burma)',
    'Cambodia',
    'Laos',
    'Nepal',
    'Sri Lanka',
    'Bhutan',
    'Maldives',
    'Fiji',
    'Papua New Guinea',
    'Solomon Islands',
    'Vanuatu',
    'Samoa',
    'Tonga',
    'Kiribati',
    'Marshall Islands',
    'Micronesia',
    'Palau',
    'Nauru',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.bgLight1,
        title: const Text(AppString.weatherApp,style: AppStyle.mediumTextStyle,),
      ),
      backgroundColor: AppColor.scaffoldBg,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AppString.selectCountryToCheckCurrentWeather,
              style: AppStyle.smallBodyStyle,
            ),
            const Gap(20),
            DropdownButton(
              dropdownColor: AppColor.bgLight1,
              value: country,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: AppColor.whiteSecondary,
              ),
              items: countries.map((String pickedCountry) {
                return DropdownMenuItem(
                  value: pickedCountry,
                  child: Text(pickedCountry),
                );
              }).toList(),
              onChanged: (String? newCountry) {
                setState(() {
                  country = newCountry!;
                });
              },
            ),
            const Gap(30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.bgLight1,
                minimumSize: const Size(220, 50),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(country: country),
                  ),
                );
              },
              child: const Text(
                AppString.checkWeather,
                style: AppStyle.buttonTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
