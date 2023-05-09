import 'package:weather_app/models/weather_model.dart';

abstract class WeatherStates {}

class WeatherInitial extends WeatherStates {}

class WeatherLoading extends WeatherStates {}

class WeatherSuccess extends WeatherStates {
  WeatherModel weatherModel;

  WeatherSuccess({required this.weatherModel});
}

class WeatherFailure extends WeatherStates {}
