import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../blocs/weather_bloc/weather_cubit.dart';

class HoursBox extends StatelessWidget {
  const HoursBox({
    super.key,
    required this.index,
    required this.cubit,
  });
  final WeatherCubit cubit;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width * 0.15,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: cubit.weatherModel!.getCardColor(
            cubit.weatherModel!.forecast!.forecastday![0].hour![index]
                .condition!.text,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            cubit.weatherModel!.forecast!.forecastday![0].hour![index].time!
                .replaceRange(0, 11, ''),
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
          ),
          Image.network(
            "https:${cubit.weatherModel!.forecast!.forecastday![0].hour![index].condition!.icon!}",
            scale: 1.2,
          ),
          Text(
            "${cubit.weatherModel!.forecast!.forecastday![0].hour![index].tempC!}°C",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
