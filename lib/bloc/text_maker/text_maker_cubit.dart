import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_part1/bloc/text_maker/text_maker_state.dart';

class TextMakerCubit extends Cubit<TextMakerState> {
  TextMakerCubit() : super(InitialTextState(text: ""));

  textToUpperCae(String text) {
    emit(UpperCaseState(text.toUpperCase()));
  }
}