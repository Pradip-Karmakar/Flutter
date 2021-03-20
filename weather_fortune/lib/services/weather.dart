import 'location.dart';
import 'networking.dart';

const apiKey = 'Your API Key';
const weatherApiUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityNmae) async {
    WeatherNetwork weatherNetwork = WeatherNetwork('$weatherApiUrl?q=$cityNmae&appid=$apiKey&units=metric');
    var weatherData = await weatherNetwork.getData();
    return weatherData;
  }

  Future<dynamic> getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    WeatherNetwork weatherNetwork = WeatherNetwork('$weatherApiUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await weatherNetwork.getData();
    return weatherData;
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
