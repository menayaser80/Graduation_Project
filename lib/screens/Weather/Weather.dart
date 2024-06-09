import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp_weather_graduation/screens/Weather/search_view.dart';
import 'package:newsapp_weather_graduation/screens/Weather/weather%20location.dart';

import '../../cubit/bloc.dart';
import '../../cubit/states.dart';
import '../../widgets/weather/no_weather_body.dart';
import '../../widgets/weather/weather_info_body.dart';
class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
             LocationService.determinePosition().then((value) {
               NewsCubit.get(context).getWeatherByLocation(location: '${value.latitude},${value.longitude}');
             });
            },
            icon: const Icon(Icons.location_on)),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchView();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.search)),

        ],
      ),
      body: BlocBuilder<NewsCubit,NewsStates>(
          builder: (context,state){
            if(state is SocialInitialState){
              return const NoWeatherBody();
            }else if(state is WeatherLoadedState){
              return WeatherInfoBody(
                  weather: state.weatherModel
              );
            }else{
              return const NoWeatherBody();
            }
          }
      ) ,
    );
  }
}