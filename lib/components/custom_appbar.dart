import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../blocs/weather_bloc/weather_cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.cubit,
  });

  final WeatherCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(left: 10, top: 5),
        decoration: BoxDecoration(
            color: cubit.weatherModel!.getCardColor(
              cubit.weatherModel!.current!.condition!.text,
            ),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 0,
                  spreadRadius: 0,
                  offset: Offset(0, 0))
            ]),
        child: AnimatedSearchBar(
          onClose: () {},
          labelStyle: GoogleFonts.poppins(
              fontSize: cubit.weatherModel!.location!.country!.length +
                          cubit.weatherModel!.location!.country!.length <
                      15
                  ? 28
                  : 18,
              color: cubit.weatherModel!
                  .getCardColor(cubit.weatherModel!.current!.condition!.text)
                  .shade100,
              fontWeight: FontWeight.w600),
          onFieldSubmitted: (text) {
            if (text.isNotEmpty) {
              cubit.getInputWeather(cityName: text);
            }
          },
          onChanged: (text) {
            cubit.userInput = text;
          },
          searchIcon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          label:
              "${cubit.weatherModel!.location!.name}, ${cubit.weatherModel!.location!.country}",
        ),
      ),
    );
  }
}
