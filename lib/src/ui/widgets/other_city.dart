import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_2/conrollers/home_controller.dart';
import 'package:weather_app_2/src/model/current_waether_data.dart';

class OtherCityWidget extends StatelessWidget {
  const OtherCityWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
          height: 150,
          child: GetBuilder<HomeController>(
            builder: (controller) => ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const VerticalDivider(
                color: Colors.transparent,
                width: 5,
              ),
              itemCount: controller.dataList.length,
              itemBuilder: (context, index) {
                CurrentWeatherData? data;
                (controller.dataList.isNotEmpty)
                    ? data = controller.dataList[index]
                    : data = null;
                return SizedBox(
                  width: 140,
                  height: 150,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          (data != null) ? '${data.name}' : '',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45,
                              ),
                        ),
                        Text(
                          (data != null)
                              ? '${(data.main!.temp! - 273.15).round().toString()}\u2103'
                              : '',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45,
                              ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/icon-01.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          (data != null)
                              ? '${data.weather![0].description}'
                              : '',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                color: Colors.black45,
                                fontSize: 14,
                              ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}

class OtherCityTitle extends StatelessWidget {
  const OtherCityTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'OTHER CITY',
            style: Theme.of(context).textTheme.caption?.copyWith(
                  fontSize: 16,
                  color: Colors.black45,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
