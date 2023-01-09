import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_part1/bloc/area_calc/area_calc_cubit.dart';
import 'package:flutter_bloc_cubit_part1/bloc/calculator/calculator_cubit.dart';
import 'package:flutter_bloc_cubit_part1/bloc/get_all_companies/get_all_companies_cubit.dart';
import 'package:flutter_bloc_cubit_part1/bloc/counter/counter_cubit.dart';
import 'package:flutter_bloc_cubit_part1/bloc/text_maker/text_maker_cubit.dart';
import 'package:flutter_bloc_cubit_part1/data/repositories/companies_repository.dart';
import 'package:flutter_bloc_cubit_part1/data/services/api_service.dart';
import 'package:flutter_bloc_cubit_part1/ui/companies/companies_screen_with_bloc_consumer.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(10),
        ),
        BlocProvider(
          create: (context) => CalculatorCubit(),
        ),
        BlocProvider(
          create: (context) => TextMakerCubit(),
        ),
        BlocProvider(
          create: (context) => AreaCalcCubit(),
        ),
        BlocProvider(
          create: (context) => CompanyCubit(CompanyRepository(apiService: ApiService())),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CompaniesScreenWithBlocConsumer(),
    );
  }
}