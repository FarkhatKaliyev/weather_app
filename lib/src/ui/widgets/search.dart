import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_2/conrollers/home_controller.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 100),
        child: GetBuilder<HomeController>(
          builder: (controller) => TextField(
            onChanged: (value) => controller.city = value,
            style: const TextStyle(
              color: Colors.white,
            ),
            textInputAction: TextInputAction.search,
            onSubmitted: (value) => controller.updateWeather(),
            decoration: InputDecoration(
              suffix: const Icon(Icons.search, color: Colors.white),
              hintStyle: const TextStyle(color: Colors.white),
              hintText: 'SEARCH',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
          ),
        ));
  }
}
