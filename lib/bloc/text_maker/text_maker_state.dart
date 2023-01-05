abstract class TextMakerState {}

class InitialTextState extends TextMakerState {
  InitialTextState({
    required this.text
  });

  final String text;
}

class UpperCaseState extends TextMakerState {
  UpperCaseState(this.textResult);

  String textResult = "";
}