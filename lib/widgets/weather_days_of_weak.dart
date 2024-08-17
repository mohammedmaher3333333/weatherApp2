import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/models/weather_model.dart';

class WeatherDaysOfWeak extends StatelessWidget {
  const WeatherDaysOfWeak({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.blue.shade800,
        ),
        padding: const EdgeInsets.only(top: 20,right: 8,left: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Next Forecast"),
                  Icon(Icons.date_range_outlined),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: convertDateToDayName().length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(convertDateToDayName()[index]),
                        Image(
                          image: NetworkImage(
                            weatherModel.day_image_in_month[index]
                                    .contains("https")
                                ? weatherModel.day_image_in_month[index]
                                : 'https:${weatherModel.day_image_in_month[index]}',
                          ),
                        ),
                        Text(
                            "${weatherModel.day_max_temp_in_month[index]}°C  ${weatherModel.day_min_temp_in_month[index]}°C"),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  List<String> convertDateToDayName() {
    List<String> dates = weatherModel.day_name_in_month;
    List<String> daysName = [];
    for (int i = 1; i < dates.length; i++) {
      DateTime dateTime = DateTime.parse(dates[i]);
      // تنسيق للحصول على اسم اليوم
      String dayName = DateFormat('EEEE').format(dateTime);
      daysName.add(dayName);
    }
    return daysName;
  }
}
