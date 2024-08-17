import 'package:flutter/material.dart';

class OtherDayViews extends StatelessWidget {
  const OtherDayViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("10 Days"),
          Text("Tommorow"),

          ListView(
            children: [],
          ),
        ],
      ),
    );
  }
}
