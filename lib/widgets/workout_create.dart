import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import '../models/workout.dart';

class WorkoutCreate extends StatefulWidget {
  const WorkoutCreate({super.key});

  @override
  State<WorkoutCreate> createState() => _WorkoutCreateState();
}

class _WorkoutCreateState extends State<WorkoutCreate> {
  late String name;
  late String date;
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
                label: Text('Название тренировки'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              key: const Key('date'),
              keyboardType: TextInputType.datetime,
              onChanged: (value) {
                setState(() {
                  date = value;
                });
              },
              decoration: const InputDecoration(
                label: Text('Дата тренировки'),
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
                label: Text('Текст тренировки'),
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
    final parsedDate = DateFormat('yyyy.MM.dd').parse(date);
    contactsBox.add(Workout(
      nameWorkout: name,
      dateWorkout: parsedDate,
      textWorkout: text,
    ));
    Navigator.of(context).pop();
  }
}
