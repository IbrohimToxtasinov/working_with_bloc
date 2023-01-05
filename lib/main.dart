import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_part1/bloc/calculator/calculator_cubit.dart';
import 'package:flutter_bloc_cubit_part1/bloc/counter/counter_cubit.dart';
import 'package:flutter_bloc_cubit_part1/bloc/text_maker/text_maker_cubit.dart';
import 'package:flutter_bloc_cubit_part1/ui/calculator_page/calculator_page.dart';
import 'package:flutter_bloc_cubit_part1/ui/homework/first_task.dart';

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
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstTask(),
    );
  }
}