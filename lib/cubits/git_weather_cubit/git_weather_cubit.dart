import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';

part 'git_weather_state.dart';

class GitWeatherCubit extends Cubit<GitWeatherState> {
  GitWeatherCubit() : super(GitWeatherInitialState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
      emit(GitWeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(GitWeatherFailureState(e.toString()));
    }
  }
}
