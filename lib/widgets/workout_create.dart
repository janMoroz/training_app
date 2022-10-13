import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/workout.dart';

class WorkoutCreate extends StatefulWidget {
  const WorkoutCreate({super.key});

  @override
  State<WorkoutCreate> createState() => _WorkoutCreateState();
}

class _WorkoutCreateState extends State<WorkoutCreate> {
  late String name;
  DateTime date = DateTime.now();
  //late String date;
  late String text;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          children: [
            TextFormField(
              key: const Key('name'),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              key: const Key('date'),
              // onChanged: (value) {
              //   setState(() {
              //     final now = DateTime.now();
              //     value = now.toString();
              //     date = value;
              //   });
              //},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              key: const Key('text'),
              onChanged: (value) {
                setState(() {
                  text = value;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _saveWorkout();
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50)),
              child: const Text('ДОБАВИТЬ'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveWorkout() {
    Box<Workout> contactsBox = Hive.box('workouts');
    contactsBox.add(Workout(
      nameWorkout: name,
      dateWorkout: date,
      textWorkout: text,
    ));
    Navigator.of(context).pop();
  }
}
