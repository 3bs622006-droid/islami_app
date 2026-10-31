import 'radio_model.dart';

class RadioViewModel {
  bool isRadioSelected = true; // للتبديل بين Radio و Reciters

  List<RadioItemModel> radioList = [
    RadioItemModel(title: "Radio Ibrahim Al-Akdar"),
    RadioItemModel(title: "Radio Al-Qaria Yassen", isPlaying: true),
    RadioItemModel(title: "Radio Ahmed Al-trabulsí"),
    RadioItemModel(title: "Radio Addokali Mohammad Alalim"),
  ];

  List<RadioItemModel> recitersList = [
    RadioItemModel(title: "Ibrahim Al-Akdar"),
    RadioItemModel(title: "Akram Alalaqmi", isPlaying: true),
    RadioItemModel(title: "Majed Al-Enezi"),
    RadioItemModel(title: "Malik shaibat Alhamed"),
  ];

  void toggleTab(bool radioSelected, Function(void Function()) updateState) {
    isRadioSelected = radioSelected;
    updateState(() {});
  }

  void togglePlay(RadioItemModel item, Function(void Function()) updateState) {
    item.isPlaying = !item.isPlaying;
    updateState(() {});
  }

  void toggleMute(RadioItemModel item, Function(void Function()) updateState) {
    item.isMuted = !item.isMuted;
    updateState(() {});
  }
}
