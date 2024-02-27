import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/blocs/weather_bloc/weather_cubit.dart';
import 'package:weatherapp/blocs/weather_bloc/weather_states.dart';
import 'package:weatherapp/components/loading_components.dart';
import 'package:weatherapp/components/success_components.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = WeatherCubit.get(context);
          if (state is WeatherLoadingState || state is WeatherErrorState) {
            return const LoadingStateView();
          } else if (state is WeatherSuccessState) {
            return const SuccessStateView();
          }
          return cubit.weatherModel == null
              ? const LoadingStateView()
              : const SuccessStateView();
        });
  }
}
