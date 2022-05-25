import 'package:clima_app/services/location.dart';
import 'package:clima_app/services/networking.dart';

const apikey = '371cfcf69c8d1fe9e2002781a3e35a22';
const mainUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper2 = NetworkHelper(
        getUrl: '$mainUrl?q=$cityName&appid=$apikey&units=metric');
    var responseData = await networkHelper2.getData();
    return responseData;
  }

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getLocation();

    NetworkHelper networkHelper1 = NetworkHelper(
        getUrl: '$mainUrl?'
            'lat=${location.lattitude}&lon=${location.longitude}&appid=$apikey&units=metric');
    var responseData = await networkHelper1.getData();

    return responseData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
