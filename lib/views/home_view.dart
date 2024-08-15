import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
          padding: const EdgeInsets.only(top: 32.0,right: 32.0,left: 32.0,bottom: 20),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        size: 32,
                      ),
                      Text(
                        "City name",
                        style: TextStyle(fontSize: 18),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 32,
                      ),
                    ],
                  ),
                  Icon(
                    Icons.search,
                    size: 32,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Image(
                  image: AssetImage('assets/image/cloudy.png'),
                ),
              ),
              const Text(
                '25°',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "weather State",
                style: TextStyle(fontSize: 25),
              ),
              const Text(
                "Max.:25°  Min.:35°",
                style: TextStyle(fontSize: 25),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue.shade800,
                ),
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, right: 8, left: 16),
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: const Row(
                  children: [
                    Image(
                      image: AssetImage("assets/image/rainDegree.png"),
                      width: 40,
                    ),
                    Text("6%"),
                    SizedBox(
                      width: 20,
                    ),
                    Image(
                      image: AssetImage("assets/image/heatDegree.png"),
                      width: 40,
                    ),
                    Text("90%"),
                    SizedBox(
                      width: 20,
                    ),
                    Image(
                      image: AssetImage("assets/image/windsDegree.png"),
                      width: 40,
                    ),
                    Text("19 km/h"),
                  ],
                ),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue.shade800,
                ),
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Today"),
                        Text("      "),
                        Text("      "),
                        Text("Mar,9"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("29°C"),
                        Text("26°C"),
                        Text("24°C"),
                        Text("23°C"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: AssetImage("assets/image/rainy.png"),
                          width: 30,
                        ),
                        Image(
                          image: AssetImage("assets/image/rainy.png"),
                          width: 30,
                        ),
                        Image(
                          image: AssetImage("assets/image/rainy.png"),
                          width: 30,
                        ),
                        Image(
                          image: AssetImage("assets/image/rainy.png"),
                          width: 30,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("15.00"),
                        Text("16.00"),
                        Text("17.00"),
                        Text("18.00"),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue.shade800,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Next Forecast"),
                            Icon(Icons.date_range_outlined),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Monday"),
                            Icon(Icons.ice_skating),
                            Text("13°C  10°C"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Monday"),
                            Icon(Icons.ice_skating),
                            Text("13°C  10°C"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
