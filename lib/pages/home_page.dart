import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_states.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/widgets/success_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text('Weather App'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherStates>(builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherSuccess) {
          return SuccessBody(weatherData: state.weatherModel);
        } else if (state is WeatherFailure) {
          return const Center(
            child: Text('Something went wrong please try again'),
          );
        } else {
          return const Center(
            child: Text(
              'There is no weather 😔 start searching now 🔍',
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.5,
                fontSize: 25,
              ),
            ),
          );
        }
      }),
    );
  }
}
