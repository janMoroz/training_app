import 'package:flutter/material.dart';

class WorkoutCreate extends StatefulWidget {
  const WorkoutCreate({super.key});

  @override
  State<WorkoutCreate> createState() => _WorkoutCreateState();
}

class _WorkoutCreateState extends State<WorkoutCreate> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50)),
              child: const Text('ДОБАВИТЬ'),
            ),
          ],
        ),
      ),
    );
  }
}
