import 'package:audioplayers/audioplayers.dart' show AssetSource, AudioPlayer;
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:learn_lao_app/utilities/helper_functions.dart';

class SoundsUtility {
  final audioPlayer = AudioPlayer();

  Future<void> playLetter(String letter) async {
    // Convert the lao
    try {
      await audioPlayer.play(
        AssetSource('letters/${laoToRomanization[letter]}-letter.wav'),
      );
    } catch (e) {
      if (kDebugMode) {
        print(
          "Error: file 'assets/letters/${laoToRomanization[letter]}-letter.wav' not found",
        );
      }
    }
  }

  Future<void> playSoundEffect(String soundEffect) async {
    try {
      await audioPlayer.play(AssetSource('sound_effects/$soundEffect.wav'));
    } catch (e) {
      if (kDebugMode) {
        print("Error: file 'assets/sound_effects/$soundEffect.wav' not found");
      }
    }
  }

  void dispose() {
    audioPlayer.dispose();
  }
}
