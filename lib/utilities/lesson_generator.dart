import 'package:learn_lao_app/exercises/learning_exercise.dart';
import 'package:learn_lao_app/exercises/matching_exercise.dart';
import 'package:learn_lao_app/exercises/select_sound_exercise.dart';
import 'package:learn_lao_app/exercises/select_letter_exercise.dart';
import 'package:learn_lao_app/exercises/stateful_exercise.dart';
import 'package:learn_lao_app/utilities/helper_functions.dart';

class LessonGenerator {
  static List<List<StatefulExercise>> generateLessonTriplet(
    List<String> oldLetters,
    List<String> newLetters,
  ) {
    List<List<StatefulExercise>> generatedLessons = [[]];
    // The first lesson is based on the following comment
    /*
    For i in [N1, N2, N3]
        Learning exercise ith letter
        Listen and match exercise ith letter
        See and match exercise ith letter
    Listen and match [O1, O2, O3]
    Randomize
        For i in [O1, O2, O3, N1, N2, N3]
            Listen and match {i}
            See and match {i}
    List1: Randomize {O1, O2, O3, N1, N2, N3}
    Listen and match {first half of List1}
    Listen and match {second half of List1}
    */
    // Generates 3 exercises for each of the new letters
    for (var letter in newLetters) {
      generatedLessons[0].addAll([
        LearningExercise(letter: letter),
        SelectLetterExercise(
          correctLetter: letter,
          allLetters: getExerciseOptions(newLetters, 3, letter),
        ),
        SelectSoundExercise(
          correctLetter: letter,
          allLetters: getExerciseOptions(newLetters, 3, letter),
        ),
      ]);
    }

    generatedLessons[0].add(MatchingExercise(lettersToMatch: oldLetters));
    // New shuffled list with all of the new and old letters
    List<String> combinedLetters = oldLetters + newLetters;
    combinedLetters.shuffle();

    final shuffledExercises = <StatefulExercise>[];
    for (var letter in combinedLetters) {
      shuffledExercises.addAll([
        SelectSoundExercise(
          correctLetter: letter,
          allLetters: getExerciseOptions(combinedLetters, 3, letter),
        ),
        SelectLetterExercise(
          correctLetter: letter,
          allLetters: getExerciseOptions(combinedLetters, 3, letter),
        ),
      ]);
    }

    shuffledExercises.shuffle();
    generatedLessons[0].addAll(shuffledExercises);

    generatedLessons[0].addAll([
      MatchingExercise(lettersToMatch: combinedLetters.sublist(0, 3)),
      MatchingExercise(lettersToMatch: combinedLetters.sublist(3, 6)),
    ]);

    return generatedLessons;
  }
}
