import 'package:weather_app_2/src/api/api_repository.dart';
import 'package:weather_app_2/src/model/current_waether_data.dart';
import 'package:weather_app_2/src/model/five_days_data.dart';

class WeatherService {
  static Future getCurrentWeather(city) async {
    final response =
        await ApiRepository.dio.get('weather', queryParameters: {'q': city});
    final data = response.data;

    if (response.statusCode == 200) {
      return CurrentWeatherData.fromJson(data);
    } else {
      return Future.error(data);
    }
  }

  static Future getFiveDaysForcast(city) async {
    final response =
        await ApiRepository.dio.get('forecast', queryParameters: {'q': city});
    final data = response.data;
    if (response.statusCode == 200) {
      return FiveDayData.parseAll(data['list']);
    } else {
      return Future.error(data);
    }
  }
}
