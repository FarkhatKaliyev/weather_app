import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_2/conrollers/home_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app_2/src/model/five_days_data.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        height: 240,
        child: GetBuilder<HomeController>(
          builder: (controller) => Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              series: <ChartSeries<FiveDayData, String>>[
                SplineSeries<FiveDayData, String>(
                  dataSource: controller.fiveDaysData,
                  xValueMapper: (FiveDayData f, _) => f.dateTime,
                  yValueMapper: (FiveDayData f, _) => f.temp,
                ),
              ],
            ),
          ),
        ));
  }
}

class ForCastTitle extends StatelessWidget {
  const ForCastTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'FORCAST NEXT 5 DAYS',
            style: Theme.of(context).textTheme.caption?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
          ),
          const Icon(
            Icons.next_plan_outlined,
            color: Colors.black45,
          ),
        ],
      ),
    );
  }
}
