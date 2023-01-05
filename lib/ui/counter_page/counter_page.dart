import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_part1/bloc/counter/counter_cubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterCubit counterCubit = CounterCubit(10);

    return BlocProvider(
      create: (context) => counterCubit,
      child: Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              // BlocBuilder<CounterCubit, int>(builder: (context, state) {
              //   return Text(
              //     "${state.toString()}  va ${NumberFormat.decimalPattern('uz_UZ').format(1000000)}",
              //     style: const TextStyle(
              //       fontSize: 40,
              //       fontWeight: FontWeight.w700,
              //     ),
              //   );
              // }),
              BlocBuilder<CounterCubit, int>(
                  builder: (context, state) {
                return Column(
                  children: [
                    Text(
                      "${state.toString()}",
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context).increment();
                          },
                          icon: Icon(Icons.add),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context).decrement();
                          },
                          icon: Icon(Icons.remove),
                        )
                      ],
                    )
                  ],
                );
              }),
            ],
          )),
    );
    // });
  }
}

//