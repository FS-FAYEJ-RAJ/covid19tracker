import 'package:covidapp/model/world_states.dart';
import 'package:flutter/material.dart';

class DetelsScreen extends StatefulWidget {
  String name,image;
  int todayCases,todayDeaths,todayRecovered;
  DetelsScreen({
    required this.name,
    required this.image,
    required this.todayCases,
    required this.todayDeaths,
    required this.todayRecovered});

  @override
  _DetelsScreenState createState() => _DetelsScreenState();
}

class _DetelsScreenState extends State<DetelsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name),
        centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Card(
                child: Column(
                  children: [
                    ReseableRow(title:'Cases', value: widget.todayDeaths.toString()),

                  ],
                ),
              )
            ],
          )
        ],
      ),

    );
  }
}
