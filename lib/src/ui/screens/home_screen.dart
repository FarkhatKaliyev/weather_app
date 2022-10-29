import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_2/conrollers/home_controller.dart';
import 'package:weather_app_2/src/ui/widgets/card.dart';
import 'package:weather_app_2/src/ui/widgets/other_city.dart';
import 'package:weather_app_2/src/ui/widgets/schedule.dart';
import 'package:weather_app_2/src/ui/widgets/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<HomeController>(builder: (controller) {
        return SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/cloud-in-blue-sky.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        leading: IconButton(
                          icon: const Icon(Icons.menu, color: Colors.white),
                          onPressed: () {},
                        ),
                      ),
                      const SearchWidget(),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                const CardWidget(),
                const SizedBox(height: 150),
                const OtherCityTitle(),
                const OtherCityWidget(),
                const ForCastTitle(),
                const ScheduleWidget(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
