import 'package:flutter/material.dart';

class EmptyLesson extends StatelessWidget {
  const EmptyLesson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Lesson not found",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Go back"),
            ),
          ],
        ),
      ),
    );
  }
}
