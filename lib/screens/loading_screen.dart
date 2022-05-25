import 'package:clima_app/services/weather.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima_app/screens/location_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

WeatherModel weather1 = WeatherModel();

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  Future<void> getLocationData() async {
    // Location location = Location();
    // await location.getLocation();
    //
    // NetworkHelper networkHelper1 = NetworkHelper(
    //     getUrl: 'https://api.openweathermap.org/data/2.5/weather?'
    //         'lat=${location.lattitude}&lon=${location.longitude}&appid=$apikey&units=metric');
    // var responseData = await networkHelper1.getData();

    var responseData = await weather1.getWeatherData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: responseData);
    }));
  }

  //
  // @override
  // void deactivate() {
  //   // TODO: implement deactivate
  //   super.deactivate();
  //   //Called when destroyed
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:
              LoadingAnimationWidget.inkDrop(color: Colors.white, size: 100)),
    );
  }
}
