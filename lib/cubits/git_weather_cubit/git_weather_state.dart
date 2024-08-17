part of 'git_weather_cubit.dart';

@immutable
sealed class GitWeatherState {}

final class GitWeatherInitialState extends GitWeatherState {
}

final class GitWeatherLoadedState extends GitWeatherState {
  final WeatherModel weatherModel;

  GitWeatherLoadedState(this.weatherModel);
}

final class GitWeatherFailureState extends GitWeatherState {
  final String errorMessage;

  GitWeatherFailureState(this.errorMessage);
}
