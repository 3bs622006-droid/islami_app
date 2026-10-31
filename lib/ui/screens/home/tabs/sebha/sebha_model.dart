class SebhaModel {
  final List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا إله إلا الله",
    "لا حول ولا قوة إلا بالله",
  ];

  int currentIndex = 0;
  int counter = 0;

  String get currentZekr => azkar[currentIndex];

  void incrementCounter() {
    counter++;
    if (counter > 33) {
      counter = 0;
      currentIndex = (currentIndex + 1) % azkar.length;
    }
  }
}
