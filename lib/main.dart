import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_part1/app/app.dart';
import 'package:flutter_bloc_cubit_part1/app/app_bloc_observer.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  runApp(const App());
}