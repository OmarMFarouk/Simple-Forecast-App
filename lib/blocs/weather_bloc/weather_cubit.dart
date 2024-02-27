import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/blocs/weather_bloc/weather_states.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/city_helper.dart';
import 'package:weatherapp/services/weather_api.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitialState());
  static WeatherCubit get(context) => BlocProvider.of(context);
  String? userInput;
  WeatherModel? weatherModel;
  getCurrentWeather() async {
    emit(WeatherLoadingState());
    var currentCityname = await CityHelper().getCityName();
    WeatherApi().getWeather(cityName: currentCityname).then((value) {
      weatherModel = WeatherModel.fromJson(value);
      emit(WeatherInitialState());
    }).catchError((err) {
      emit(WeatherErrorState());
    });
  }

  getInputWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    WeatherApi().getWeather(cityName: cityName).then((value) {
      if (value != 'Not Found') {
        weatherModel = WeatherModel.fromJson(value);
        emit(WeatherSuccessState());
      } else {
        WeatherErrorState();
      }
    });
  }

  currentDateFormatter(String opp) {
    DateTime timeStamp = DateTime.now();
    if (opp == "day") {
      return DateFormat('EEEE').format(timeStamp);
    } else {
      return DateFormat('d MMM, yyyy').format(timeStamp);
    }
  }

  dateChecker(String opp, var timeStamp) {
    if (opp == "day") {
      return DateFormat('EEEE').format(timeStamp);
    } else if (opp == 'dayofmonth') {
      return DateFormat('d MMM').format(timeStamp);
    } else {
      return DateFormat('d MMM, yyyy').format(timeStamp);
    }
  }
}
