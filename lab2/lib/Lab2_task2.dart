import 'dart:async';

Future<String> fetchWeatherData() async {
  await Future.delayed(Duration(seconds: 3)); // Simulating network delay
  return "Weather Fetched .";
}

void main() async {
  print("Fetching weather data...");

  try {
    var weather = await fetchWeatherData();
    print("Weather Data: $weather");
  } catch (e) {
    print("Error fetching weather data: $e");
  }
}
