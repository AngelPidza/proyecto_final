abstract class FirstTimeState {
  const FirstTimeState();
}

class FirstTimeInitial extends FirstTimeState {}

class FirstTimeStatus extends FirstTimeState {
  final bool isFirstTime;
  const FirstTimeStatus(this.isFirstTime);
}
