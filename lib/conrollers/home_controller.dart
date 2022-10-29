import 'package:get/get.dart';
import 'package:weather_app_2/src/model/current_waether_data.dart';
import 'package:weather_app_2/src/model/five_days_data.dart';
import 'package:weather_app_2/src/service/weather_service.dart';

class HomeController extends GetxController {
  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<CurrentWeatherData> dataList = [];
  List<FiveDayData> fiveDaysData = [];
  String city;

  HomeController({required this.city});

  @override
  void onInit() async {
    await initState();
    await getTopFiveCities();
    update();
    super.onInit();
  }

  void updateWeather() async {
    await initState();
  }

  Future initState() async {
    await getCurrentWeather();
    await getFiveDaysData();
    update();
  }

  Future getCurrentWeather() async {
    currentWeatherData = await WeatherService.getCurrentWeather(city);
    return currentWeatherData;
  }

  Future getTopFiveCities() async {
    List<String> cities = ['London', 'New York', 'Paris', 'Moscow', 'Tokyo'];
    for (int i = 0; i < cities.length; i++) {
      dataList.add(await WeatherService.getCurrentWeather(cities[i]));
    }
  }

  Future getFiveDaysData() async {
    fiveDaysData = await WeatherService.getFiveDaysForcast(city);
  }
}
