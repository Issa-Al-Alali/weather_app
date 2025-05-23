import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Widget getWeatherIcon(int code){
    switch(code){
      case >=200 && < 300:
        return Image.asset(
          'assets/pic10.png',
          width: 400.0,
          height: 250.0,
        );
      case >=300 && < 400:
        return Image.asset('assets/pic5.png',
          width: 400.0,
          height: 250.0,);
      case >=500 && < 600:
        return Image.asset('assets/pic3.png',
          width: 400.0,
          height: 250.0,);
      case >= 600 && < 700:
        return Image.asset('assets/pic2.png',
          width: 400.0,
          height: 250.0,);
      case >=700 && < 800:
        return Image.asset('assets/pic1.png',
          width: 400.0,
          height: 250.0,);
      case ==800:
        return Image.asset('assets/pic4.png',
          width: 400.0,
          height: 250.0,);
      case >800 && <=804:
        return Image.asset('assets/pic7.png',
          width: 400.0,
          height: 250.0,);
      default:
        return Image.asset('assets/pic7.png',
          width: 400.0,
          height: 250.0,);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 1.2 * kToolbarHeight, 15, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(3,-0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration:const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration:const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 250,
                  width: 600,
                  decoration: const BoxDecoration(
                    color: Colors.amber
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent
                  ),
                ),
              ),
              BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if(state is WeatherSuccess){
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '📍 ${state.weather.areaName}',
                        style:const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                      const SizedBox(height: 8,),
                      const Text(
                        'Good Morning',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Center(
                        child: getWeatherIcon(state.weather.weatherConditionCode!)
                        // child: Image.asset(
                        //   'assets/pic3.png',
                        //   width: 400.0,
                        //   height: 250.0,
                        // ),
                      ),
                      Center(
                        child: Text(
                          '${state.weather.temperature!.celsius!.round()}℃',
                          style:const TextStyle(
                            color: Colors.white,
                            fontSize: 55,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          state.weather.weatherMain!.toUpperCase(),
                          style:const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Center(
                        child: Text(
                          DateFormat('EEEE dd •').add_jm().format(state.weather.date!),
                          // 'Friday 16 + 09.41am',
                          style:const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/pic4.png',
                                width: 70,
                                height: 50,
                              ),
                              const SizedBox(width: 5,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Sunrise',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300
                                    ),
                                  ),
                                  const SizedBox(height: 3,),
                                  Text(
                                    DateFormat().add_jm().format(state.weather.sunrise!),
                                    // '5:34 am',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/pic6.png',
                                width: 70,
                                height: 50,
                              ),
                              const SizedBox(width: 5,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Sunset',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300
                                    ),
                                  ),
                                  const SizedBox(height: 3,),
                                  Text(
                                    DateFormat().add_jm().format(state.weather.sunset!),
                                    // '5:34 pm',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/pic9.png',
                                width: 70,
                                height: 50,
                              ),
                              const SizedBox(width: 5,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Temp Max',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300
                                    ),
                                  ),
                                  const SizedBox(height: 3,),
                                  Text(
                                    "${state.weather.tempMax!.celsius!.round()} ℃",
                                    style:const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/pic8.png',
                                width: 70,
                                height: 50,
                              ),
                              const SizedBox(width: 5,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Temp Min',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300
                                    ),
                                  ),
                                  const SizedBox(height: 3,),
                                  Text(
                                    "${state.weather.tempMin!.celsius!.round()} ℃",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );} else{
                  return Container();
                }
              },
            )
            ],
          ),
        ),
      ),
    );
  }
}
