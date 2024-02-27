import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApi {
  String baseUrl = 'http://api.weatherapi.com/v1/forecast.json';
  String apiKey = '8f7ccbf1d6e844dcad7132746230607';

  Future getWeather({required String cityName}) async {
    Uri url = Uri.parse('$baseUrl?key=$apiKey&q=$cityName&days=7');
    http.Response response = await http.get(url);
    if (response.statusCode == 400) {
      return 'Not Found';
    }
    Map<String, dynamic> data = jsonDecode(response.body);
    print(data);

    return data;
  }
}
