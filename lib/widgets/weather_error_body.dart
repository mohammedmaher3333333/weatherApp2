import 'package:flutter/material.dart';

class WeatherErrorBody extends StatelessWidget {
  const WeatherErrorBody({super.key, required this.errorMessage});
final String errorMessage;
  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Image(
                  image: AssetImage("assets/image/weather.png"),
                  width: 200,
                ),
              ),
              const SizedBox(height: 30,),
              const Text(
                  "Don't worry about the weather we all here but there was an error"),
              Text(
                'Error: $errorMessage',
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
