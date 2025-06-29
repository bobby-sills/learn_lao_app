import 'package:flutter/material.dart';
import 'package:learn_lao_app/components/bottom_lesson_button.dart';
import 'package:learn_lao_app/exercises/select_blank_exercise.dart';
import 'package:learn_lao_app/utilities/provider/lesson_provider.dart';
import 'package:provider/provider.dart';
import 'package:learn_lao_app/utilities/shared_styles.dart';

enum BottomButtonState { incorrect, correct }

class SelectSoundExercise extends SelectBlankExercise {
  SelectSoundExercise({
    required super.correctLetter,
    required super.allLetters,
    super.key,
  });

  @override
  SelectSoundExerciseState createState() => SelectSoundExerciseState();
}

class SelectSoundExerciseState
    extends SelectBlankExerciseState<SelectSoundExercise> {
  @override
  Widget build(BuildContext context) {
    calibrateThemeColors(context);

    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 2,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  widget.correctLetter,
                  style: laoStyle.copyWith(fontSize: 10000),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                spacing: 8.0,
                children: List<Widget>.generate(shuffledLetters.length, (
                  index,
                ) {
                  final letter = shuffledLetters[index];
                  return FilledButton(
                    onPressed: () {
                      speechPlayer.playLetter(letter);
                      setState(() {
                        selectedButton = index;
                      });
                    },
                    style: FilledButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 100,
                      ),
                      backgroundColor: index == selectedButton
                          ? theme.colorScheme.primary
                          : theme.colorScheme.secondary,
                    ),
                    child: Icon(
                      Icons.volume_up_rounded,
                      size: theme.textTheme.displayMedium?.fontSize,
                    ),
                  );
                }),
              ),
            ),
            SafeArea(
              child: BottomLessonButton(
                onPressed: (selectedButton == -1) ? null : checkAnswer,
                buttonText: 'Check',
                buttonIcon: const Icon(Icons.check_rounded),
              ),
            ), // The bottom button
          ],
        ),
      ),
    );
  }

  @override
  Widget bottomSheetContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 8),
        Text(
          bottomButtonIsCorrect ? 'Correct!' : 'Incorrect!',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        BottomLessonButton(
          onPressed: bottomButtonIsCorrect
              ? Provider.of<LessonProvider>(
                  context,
                  listen: false,
                ).nextExerciseCallback
              : Navigator.of(
                  context,
                ).pop, // Close the bottom sheet no matter what,
          buttonIcon: bottomButtonIsCorrect
              ? const Icon(Icons.arrow_forward_rounded)
              : const Icon(Icons.refresh_rounded),
          buttonText: bottomButtonIsCorrect ? 'Continue' : 'Try Again',
          buttonColor: bottomButtonIsCorrect ? Colors.green : Colors.red,
        ),
      ],
    );
  }
}
