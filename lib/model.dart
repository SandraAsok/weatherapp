// ignore_for_file: prefer_typing_uninitialized_variables

class WeatherModel {
  WeatherModel({required this.currentWeather, required this.hourly});
  final currentWeather;
  final hourly;

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    final currentWeather = data["current_weather"] as Map<String, dynamic>;
    final hourly = data["hourly"] as Map<String, dynamic>;
    return WeatherModel(currentWeather: currentWeather, hourly: hourly);
  }
}

class CurrentWeather {
  CurrentWeather({
    required this.temperature,
    required this.windspeed,
    required this.weathercode,
    required this.winddirection,
    required this.isDay,
  });

  final double temperature;
  final double windspeed;
  final int weathercode;
  final double winddirection;
  final int isDay;

  factory CurrentWeather.fromJson(Map<String, dynamic> data) {
    final temperature = data["temperature"] as double;
    final windspeed = data["windspeed"] as double;
    final winddirection = data["winddirection"] as double;
    final weathercode = data["weathercode"] as int;
    final isDay = data["isDay"] as int;

    return CurrentWeather(
      temperature: temperature,
      windspeed: windspeed,
      weathercode: weathercode,
      winddirection: winddirection,
      isDay: isDay,
    );
  }
}

class HourlyCast {
  HourlyCast({required this.time, required this.temperatures});

  final List<String> time;
  final List<double> temperatures;

  factory HourlyCast.fromJson(Map<String, dynamic> data) {
    final List<String> time = data["time"] as List<String>;
    final List<double> temperatures = data["temperature_2m"] as List<double>;
    return HourlyCast(time: time, temperatures: temperatures);
  }
}
