import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/blocs/weather_bloc/weather_cubit.dart';
import 'package:weatherapp/blocs/weather_bloc/weather_states.dart';
import 'package:weatherapp/components/custom_appbar.dart';
import 'package:weatherapp/components/details_box.dart';
import 'package:weatherapp/components/hours_box.dart';

class SuccessStateView extends StatelessWidget {
  const SuccessStateView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = WeatherCubit.get(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(
                preferredSize: const Size(double.infinity, 65),
                child: CustomAppBar(cubit: cubit)),
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                    color: cubit.weatherModel!.getCardColor(
                        cubit.weatherModel!.current!.condition!.text),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                  ),
                  child: DetailsBox(cubit: cubit),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hourly Forecast",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff48738D)),
                      ),
                      const Icon(
                        Icons.access_time_sharp,
                        color: Color(0xff48738D),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(
                      itemCount: cubit
                          .weatherModel!.forecast!.forecastday![0].hour!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return HoursBox(
                          cubit: cubit,
                          index: index,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
