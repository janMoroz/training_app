import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:training_app_hive/models/workout.dart';
import 'package:training_app_hive/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WorkoutAdapter());
  await Hive.openBox<Workout>('workouts');

  runApp(MyApp());
}
