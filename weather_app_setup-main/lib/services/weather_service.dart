import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';

  String apiKey = '3677bed892474b30b7a122242220806';
  Future<WeatherModel> getWeather({required String cityName}) async {
    // Uri url =
    //     Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');

    var url = Uri.http('api.weatherapi.com', 'v1/forecast.json', {'key': apiKey,"q":cityName,'days':"7"});

    print("url");
    //http://api.weatherapi.com/v1/forecast.json?key=3677bed892474b30b7a122242220806&q=Cairo&days=7
    print(url);
    http.Response response = await http.get(url);
    // var response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 400) {
    var data  = jsonDecode(response.body);
      throw Exception(data['error']['message']);
    }
    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson2(data);

    return weather;
  }
}
