import 'sebha_model.dart';

class SebhaViewModel {
  final SebhaModel _sebhaModel = SebhaModel();

  String get zekr => _sebhaModel.currentZekr;

  int get counter => _sebhaModel.counter;

  void onSebhaPressed(Function(void Function()) updateState) {
    _sebhaModel.incrementCounter();
    updateState(() {});
  }
}
