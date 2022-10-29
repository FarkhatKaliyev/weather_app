import 'package:get/get.dart';
import 'package:weather_app_2/conrollers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(city: 'Karaganda'));
  }
}