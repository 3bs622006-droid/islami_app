class RadioItemModel {
  final String title;
  bool isPlaying;
  bool isMuted;

  RadioItemModel({
    required this.title,
    this.isPlaying = false,
    this.isMuted = false,
  });
}
