import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_app_hive/widgets/workout_create.dart';

class CreateWorkoutPage extends StatefulWidget {
  const CreateWorkoutPage({super.key});

  @override
  State<CreateWorkoutPage> createState() => _CreateWorkoutPageState();
}

class _CreateWorkoutPageState extends State<CreateWorkoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.keyboard_arrow_left),
        ),
        title: const Text('Новая тренировка'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: WorkoutCreate(),
      ),
    );
  }
}
