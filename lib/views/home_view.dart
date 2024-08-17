import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/git_weather_cubit/git_weather_cubit.dart';
import 'package:weather/widgets/search_view.dart';
import 'package:weather/widgets/weather_error_body.dart';
import 'package:weather/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GitWeatherCubit,GitWeatherState>(builder: (context,state){
        if(state is GitWeatherInitialState){
          return SearchView();
        } else if (state is GitWeatherLoadedState) {
          return WeatherInfoBody();
        } else if (state is GitWeatherFailureState) {
          return WeatherErrorBody(errorMessage: state.errorMessage,);
        }else {return const Text("ops there was an error");}
      }
      ),
    );
  }
}
