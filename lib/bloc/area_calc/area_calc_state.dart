abstract class AreaCalcState {}

class InitialAreaState extends AreaCalcState {
  InitialAreaState({
    required this.a,
    required this.b,
  });

  final int a;
  final int b;
}

class TriangleState extends AreaCalcState {
  TriangleState(this.triangleResult);

  num triangleResult = 0;
}

class RectangleState extends AreaCalcState {
  RectangleState(this.rectangleResult);

  num rectangleResult = 0;
}

class CircleState extends AreaCalcState {
  CircleState(this.circleResult);

  num circleResult = 0;
}
