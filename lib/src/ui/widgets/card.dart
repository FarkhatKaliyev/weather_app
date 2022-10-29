import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_2/conrollers/home_controller.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Align(
        alignment: const Alignment(0, 1),
        child: SizedBox(
          height: 10,
          width: 10,
          child: OverflowBox(
            minWidth: 0.0,
            maxWidth: MediaQuery.of(context).size.width,
            minHeight: 0.0,
            maxHeight: MediaQuery.of(context).size.width - 140,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              height: double.infinity,
              child: Card(
                color: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(top: 15, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              (controller.currentWeatherData != null)
                                  ? '${controller.currentWeatherData.name}'
                                      .toUpperCase()
                                  : '',
                              style:
                                  Theme.of(context).textTheme.caption?.copyWith(
                                        color: Colors.black45,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                          ),
                          Center(
                            child: Text(
                              DateFormat()
                                  .add_MMMMEEEEd()
                                  .format(DateTime.now()),
                              style:
                                  Theme.of(context).textTheme.caption?.copyWith(
                                        color: Colors.black45,
                                        fontSize: 16,
                                      ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 50),
                          child: Column(
                            children: [
                              Container(
                                width: 180,
                                child: Center(
                                  child: Expanded(
                                    child: Text(
                                      (controller.currentWeatherData.weather !=
                                              null)
                                          ? '${controller.currentWeatherData.weather![0].description}'
                                          : '',
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          ?.copyWith(
                                            color: Colors.black45,
                                            fontSize: 22,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                (controller.currentWeatherData.main != null)
                                    ? '${(controller.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103'
                                    : '',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    ?.copyWith(
                                      color: Colors.black45,
                                    ),
                              ),
                              Text(
                                (controller.currentWeatherData.main != null)
                                    ? 'min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main!.tempMax! - 273.15).round().toString()}\u2103'
                                    : '',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(
                                      color: Colors.black45,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/icon-01.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                (controller.currentWeatherData.wind != null)
                                    ? 'wind ${controller.currentWeatherData.wind?.speed} m/s'
                                    : '',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(
                                      color: Colors.black45,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
