import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherStateInitial());
  WeatherService weatherService;
late  WeatherModel weatherModel ;
late  String city_name ;

  Future<void> getWeather({required String citeName}) async {
    city_name=citeName;
    emit(WeatherStateLoading());

    try {
      weatherModel=   await weatherService.getWeather(cityName: citeName);
      emit(WeatherStateSuccess());
    } on Exception catch (ex) {
      emit(WeatherStateFailure());
    }
  }
}
