import 'package:flutter/foundation.dart';

class LessonProvider with ChangeNotifier {
  VoidCallback? nextExerciseCallback;
  bool _isBottomSheetVisible = false;

  void setNextExerciseCallback(VoidCallback callback) {
    nextExerciseCallback = callback;
  }

  void setBottomSheetVisible(bool isVisible) {
    _isBottomSheetVisible = isVisible;
    notifyListeners();
  }

  bool get isBottomSheetVisible => _isBottomSheetVisible;
}