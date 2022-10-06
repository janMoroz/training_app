import 'package:hive/hive.dart';
import 'package:training_app_hive/models/workout.dart';

class Boxes {
  static Box<Workout> getWorkouts() => Hive.box<Workout>('workouts');
}
