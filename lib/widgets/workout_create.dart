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
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

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
              controller: _dateController,
              onTap: () async {
                DateTime? datePicked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2022),
                  lastDate: DateTime(2027),
                );
                date = DateFormat('yyyy.MM.dd').format(datePicked!);
                setState(() {
                  _dateController.text = date;
                });
              },
              readOnly: true,
              keyboardType: TextInputType.datetime,
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
