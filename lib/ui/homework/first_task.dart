import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_part1/bloc/text_maker/text_maker_cubit.dart';
import 'package:flutter_bloc_cubit_part1/bloc/text_maker/text_maker_state.dart';

class FirstTask extends StatefulWidget {
  const FirstTask({super.key});

  @override
  State<FirstTask> createState() => _FirstTaskState();
}

class _FirstTaskState extends State<FirstTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task 1"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          BlocBuilder<TextMakerCubit, TextMakerState>(
            builder: (context, state) {
              if (state is UpperCaseState) {
                return Text(
                  state.textResult,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                );
              }
              else {
                const SizedBox();
              }
              return const SizedBox();
            },
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: TextField(
              onChanged: (value) {
                BlocProvider.of<TextMakerCubit>(context).textToUpperCae(
                  value.toString(),
                );
              },
              decoration: const InputDecoration(
                labelText: 'Enter your name',
                labelStyle: TextStyle(fontSize: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
