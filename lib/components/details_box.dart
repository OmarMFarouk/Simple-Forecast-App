// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/blocs/weather_bloc/weather_cubit.dart';

class DetailsBox extends StatelessWidget {
  final WeatherCubit cubit;

  const DetailsBox({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(0, -0.4),
          child: Text(
            "${cubit.weatherModel!.current!.tempC}°C",
            style: GoogleFonts.poppins(
                color: cubit.weatherModel!
                    .getCardColor(cubit.weatherModel!.current!.condition!.text)
                    .shade100,
                fontSize: 90,
                fontWeight: FontWeight.w600),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0, 0.1),
          child: Image.network(
            "http:${cubit.weatherModel!.current!.condition!.icon}",
            scale: 0.7,
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0, 0.3),
          child: Text(
            "${cubit.weatherModel!.current!.condition!.text}",
            style: GoogleFonts.poppins(
                letterSpacing: 3,
                color: const Color(0xffE8FCFF),
                fontSize: 24,
                fontWeight: FontWeight.w600),
          ),
        ),
        Positioned(
          bottom: 40,
          left: 150,
          child: Column(
            children: [
              Text(
                cubit.currentDateFormatter('day').toString(),
                style: GoogleFonts.poppins(
                    color: const Color(0xffE8FCFF),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                cubit.currentDateFormatter('date').toString(),
                style: GoogleFonts.poppins(
                    color: const Color(0xffE8FCFF),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
