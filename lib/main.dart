// ignore_for_file: non_constant_identifier_names, prefer_if_null_operators, avoid_print

import 'package:flutter/material.dart';
import 'package:weatherapp/client.dart';
import 'package:weatherapp/constants.dart';
import 'package:weatherapp/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherApp(),
    );
  }
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  WeatherModel? weather;
  List<dynamic>? hourly_temp;
  List<dynamic>? hourly_date;
  List<Widget>? hourly_cast;
  List<Widget>? hourly_cast_date;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Current Weather",
                  style: mainStyle,
                ),
                kHeight20,
                const Icon(
                  Icons.sunny,
                  color: Colors.amber,
                  size: 64,
                ),
                kHeight20,
                Text(
                  "${weather?.currentWeather["temperature"] != null ? weather?.currentWeather["temperature"] : 0}°C",
                  style: mainStyle,
                ),
                ElevatedButton(
                  onPressed: () async {
                    weather = await WeatherApiClient().request();
                    print(weather?.currentWeather);
                    hourly_temp = weather?.hourly["temperature_2m"];
                    hourly_date = weather?.hourly["time"];
                    hourly_cast = hourly_temp
                        ?.map((e) => Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "$e°C",
                                style: subStyle,
                              ),
                            ))
                        .toList();

                    hourly_cast_date = hourly_date
                        ?.map((e) => Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "$e",
                                style: subStyle,
                              ),
                            ))
                        .toList();

                    setState(() {});
                  },
                  child: const Text("Get Data"),
                ),
                Container(
                  margin: const EdgeInsets.all(25),
                  color: Colors.blueGrey[900],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: hourly_cast_date == null
                            ? [
                                const Text(
                                  "Empty",
                                  style: TextStyle(color: Colors.white),
                                )
                              ]
                            : hourly_cast_date!,
                      ),
                      Column(
                        children: hourly_cast == null
                            ? [const Text("Empty")]
                            : hourly_cast!,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
