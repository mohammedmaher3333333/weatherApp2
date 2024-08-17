import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/models/weather_model.dart';

class TempForHour extends StatelessWidget {
  const TempForHour({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blue.shade800,
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Today"),
                Text("${weatherModel.monthName},${weatherModel.dateTime.day}"),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: weatherModel.temp_c_for_hour_in_Day.length,
                    itemBuilder: (context, index) {
                      DateTime currentTime = DateTime.now();
                      DateTime timeInList =
                          weatherModel.time_for_hour_in_Day[index];
                      bool isCurrentTime = timeInList.hour == currentTime.hour;

                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: isCurrentTime
                              ? Border.all(color: Colors.yellow, width: 2)
                              : null,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                                '${weatherModel.temp_c_for_hour_in_Day[index].round()}°C'),
                            Image(
                              image: NetworkImage(
                                weatherModel.image_for_hour_in_Day[index]
                                        .contains("https")
                                    ? weatherModel.image_for_hour_in_Day[index]
                                    : 'https:${weatherModel.image_for_hour_in_Day[index]}',
                              ),
                              width: 40,
                            ),
                            Text(DateFormat('HH:mm').format(timeInList)),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
