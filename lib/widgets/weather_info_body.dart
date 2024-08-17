import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/git_weather_cubit/git_weather_cubit.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/widgets/data_for_today.dart';
import 'package:weather/widgets/temp_for_hour.dart';
import 'package:weather/widgets/update_search_view.dart';
import 'package:weather/widgets/weather_days_of_weak.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GitWeatherCubit>(context).weatherModel!;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blueAccent,
              Colors.blue,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              right: 16.0, left: 16.0,top: 32, bottom: 12),
          child: Column(
            children: [
              UpdateSearchView(weatherModel: weatherModel),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: NetworkImage(
                      weatherModel.image.contains("https")
                          ? weatherModel.image
                          : 'https:${weatherModel.image}',
                    ),
                  ),
                  Text(
                    '${weatherModel.Temp.round()}',
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                weatherModel.weatherCondition,
                style: const TextStyle(fontSize: 25),
              ),
              Text(
                "Max.:${weatherModel.maxTemp.round()}°    Min.:${weatherModel.minTemp.round()}°",
                style: const TextStyle(fontSize: 25),
              ),
              DataForToday(weatherModel: weatherModel,),
              TempForHour(weatherModel: weatherModel),
              WeatherDaysOfWeak(weatherModel: weatherModel),
            ],
          ),
        ),
      ),
    );
  }
}

