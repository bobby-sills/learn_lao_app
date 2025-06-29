import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn_lao_app/components/lesson_nav_button.dart';
import 'package:learn_lao_app/utilities/hive_utility.dart';

enum LessonStatus { notStarted, nextUp, completed }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int lessonButtonSize = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: Hive.box<bool>(
          HiveUtility.lessonCompletionBox,
        ).listenable(),
        builder: (context, box, _) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: 20,
              itemBuilder: (context, index) {
                final double xOffset = sin(index * 100) * 96;
                // If the lesson is complete, set the status to completed
                // If the previous lesson is completed, set the status to nextUp
                // But even if the previous lesson is not complete, set the status to nextUp if it's the first lesson
                // Otherwise, set the status to notStarted
                final lessonStatus = HiveUtility.isLessonCompleted(index)
                    ? LessonStatus.completed
                    : HiveUtility.isLessonCompleted(index - 1)
                    ? LessonStatus.nextUp
                    : index == 0
                    ? LessonStatus.nextUp
                    : LessonStatus.notStarted;

                return Center(
                  child: Transform.translate(
                    offset: Offset(xOffset, 0),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: LessonNavButton(
                        index: index,
                        lessonStatus: lessonStatus,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
