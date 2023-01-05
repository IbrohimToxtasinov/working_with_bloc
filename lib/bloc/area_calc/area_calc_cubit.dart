import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_part1/bloc/area_calc/area_calc_state.dart';

class AreaCalcCubit extends Cubit<AreaCalcState> {
  AreaCalcCubit() : super(InitialAreaState(a: 10, b: 15));

  triangle(int a, int b) {
    emit(TriangleState(a + b));
  }

  rectangle(int a, int b) {
    RectangleState rectangleState = RectangleState(a - b);
    emit(rectangleState);
  }

  circle(int a, int b) {
    emit(CircleState(a * b));
  }
}