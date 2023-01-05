import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_part1/bloc/area_calc/area_calc_cubit.dart';
import 'package:flutter_bloc_cubit_part1/bloc/area_calc/area_calc_state.dart';
import 'package:flutter_bloc_cubit_part1/bloc/calculator/calculator_cubit.dart';

class SecondTask extends StatelessWidget {
  const SecondTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Task 2"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<AreaCalcCubit, AreaCalcState>(
              builder: (context, state) {
                if (state is CircleState) {
                  return Text(
                    "This is circle:${state.circleResult}",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  );
                } else if (state is TriangleState) {
                  return Text(
                    "This is triangle:${state.triangleResult}",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  );
                } else if (state is RectangleState) {
                  return Text(
                    "This is rectangle:${state.rectangleResult}",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  );
                }
                return const Text(
                  "Initial state",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AreaCalcCubit>(context).circle(5);
                    },
                    child : const Text("circle")),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AreaCalcCubit>(context).triangle(6, 6);
                    },
                    child : const Text("triangle")),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AreaCalcCubit>(context)
                          .rectangle(6, 6);
                    },
                    child : const Text("rectangle")),
              ],
            )
          ],
        ));
  }
}