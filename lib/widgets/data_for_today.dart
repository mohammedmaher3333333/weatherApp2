import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';

class DataForToday extends StatelessWidget {
  const DataForToday({super.key, required this.weatherModel});
final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.blue.shade800,
          ),
          padding: const EdgeInsets.only(
              top: 8, bottom: 8, right: 8, left: 16),
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              const Image(
                image: AssetImage("assets/image/rainDegree.png"),
                width: 40,
              ),
              Text("${weatherModel.totalprecip_mm.round()}%"),
              const SizedBox(
                width: 20,
              ),
              const Image(
                image: AssetImage("assets/image/heatDegree.png"),
                width: 40,
              ),
              Text("${weatherModel.avghumidity.round()}%"),
              const SizedBox(
                width: 20,
              ),
              const Image(
                image: AssetImage("assets/image/windsDegree.png"),
                width: 40,
              ),
              Text("${weatherModel.maxwind.round()} km/h"),
            ],
          ),
        );
  }
}
