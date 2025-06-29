import 'package:flutter/material.dart';
import 'package:learn_lao_app/exercises/stateful_exercise.dart';
import 'package:learn_lao_app/utilities/provider/lesson_provider.dart';
import 'package:learn_lao_app/utilities/sounds_utility.dart';
import 'package:provider/provider.dart';

enum BottomButtonState { incorrect, correct }

// This new abstract class extends StatefulExercise
abstract class SelectBlankExercise extends StatefulExercise {
  final String correctLetter;
  final List<String> allLetters;

  SelectBlankExercise({
    required this.correctLetter,
    required this.allLetters,
    super.key,
  });

  @override
  State<SelectBlankExercise> createState();
}

// The corresponding State class that extends StatefulExerciseState
abstract class SelectBlankExerciseState<T extends SelectBlankExercise>
    extends StatefulExerciseState<T> {
  final effectPlayer = SoundsUtility();
  final speechPlayer = SoundsUtility();
  late final List<String> shuffledLetters;
  late ThemeData theme;
  late bool isDarkMode;
  late Color svgColor;
  bool bottomButtonIsCorrect = true;
  var selectedButton = -1;

  void checkAnswer() {
    final bool isCorrect =
        shuffledLetters[selectedButton] == widget.correctLetter;

    if (isCorrect) {
      // If the answer is correct
      setState(() => bottomButtonIsCorrect = true);
      effectPlayer.playSoundEffect('correct');
    } else {
      // If the answer is incorrect
      setState(() => bottomButtonIsCorrect = false);
      effectPlayer.playSoundEffect('incorrect');
    }
    showBottomBar(
      context: context,
      onShow: () {
        Provider.of<LessonProvider>(
          context,
          listen: false,
        ).setBottomSheetVisible(true);
      },
      onHide: () {
        Provider.of<LessonProvider>(
          context,
          listen: false,
        ).setBottomSheetVisible(false);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // Adds the correct letter plus the incorrect letters to the list of options
    shuffledLetters = List.from(widget.allLetters);
    shuffledLetters.shuffle();

    assert(
      (widget.allLetters.length - 1) <= 2,
      'There can be a maximum of 2 incorrect letters',
    );

    assert(
      widget.allLetters.contains(widget.correctLetter),
      'allLetters must contain correctLetter',
    );
  }

  void calibrateThemeColors(context) {
    theme = Theme.of(context);
    isDarkMode = theme.brightness == Brightness.dark;
    svgColor = isDarkMode ? Colors.white : Colors.black;
  }

  // The build method is still required (inherited from StatefulExerciseState)
  @override
  Widget build(BuildContext context);
}
