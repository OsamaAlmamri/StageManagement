import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherStateLoading());
  WeatherService weatherService;
late  WeatherModel weatherModel ;

  Future<void> getWeather({required String citeName}) async {
    emit(WeatherStateLoading());

    try {
      weatherModel=   await weatherService.getWeather(cityName: citeName);
      emit(WeatherStateSuccess());
    } on Exception catch (ex) {
      emit(WeatherStateFailure());
    }
  }
}
