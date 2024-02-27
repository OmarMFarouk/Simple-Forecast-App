import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/blocs/weather_bloc/weather_cubit.dart';
import 'package:weatherapp/screens/main_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => WeatherCubit()..getCurrentWeather())
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainScreen(),
        ));
  }
}
