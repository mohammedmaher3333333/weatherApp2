import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/git_weather_cubit/git_weather_cubit.dart';
import 'package:weather/models/weather_model.dart';

class UpdateSearchView extends StatelessWidget {
  const UpdateSearchView({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.location_on_rounded,
                size: 32,
              ),
              Text(
                weatherModel.cityName,
                style: const TextStyle(fontSize: 18),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.keyboard_arrow_down, size: 32),
              ),
            ],
          ),
          IconButton(
            onPressed: () async {
              String? cityName = await _showSearchDialog(context);
              if (cityName != null && cityName.isNotEmpty) {
                BlocProvider.of<GitWeatherCubit>(context)
                    .getWeather(cityName: cityName);
              }
            },
            icon: const Icon(
              Icons.search,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> _showSearchDialog(BuildContext context) async {
    String? cityName;
    final TextEditingController _controller = TextEditingController();
    final FocusNode _focusNode = FocusNode();

    return showDialog<String>(
      context: context,
      builder: (context) {
        // بعد بناء الودجت، نطلب من FocusScope أن يركز على TextField
        WidgetsBinding.instance.addPostFrameCallback((_) {
          FocusScope.of(context).requestFocus(_focusNode);
        });

        return AlertDialog(
          title: const Text('Enter City Name'),
          content: SingleChildScrollView(
            child: TextField(
              onSubmitted: (value) async {
                Navigator.of(context).pop(cityName);
              },
              controller: _controller,
              focusNode: _focusNode,
              onChanged: (value) {
                cityName = value;
              },
              decoration: const InputDecoration(hintText: "City Name"),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(cityName);
              },
              child: const Text('Search'),
            ),
          ],
        );
      },
    );
  }
}
