import 'package:weather_app/models/weather_model.dart';

abstract class WeatherState {}

class WeatherStateInitial extends WeatherState {}

class WeatherStateLoading extends WeatherState {}

class WeatherStateSuccess extends WeatherState {
  WeatherStateSuccess({required this.weatherModel});
 final WeatherModel? weatherModel;

}

class WeatherStateFailure extends WeatherState {}
