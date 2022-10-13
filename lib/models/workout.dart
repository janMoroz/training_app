import 'package:hive/hive.dart';
part 'workout.g.dart';

@HiveType(typeId: 0)
class Workout extends HiveObject{
  @HiveField(0)
  bool complete;

  @HiveField(1)
  String nameWorkout;

  @HiveField(2)
  DateTime dateWorkout;

  @HiveField(3)
  String textWorkout;

  Workout({
    this.complete = false,
    required this.nameWorkout,
    required this.dateWorkout,
    required this.textWorkout,
  });
}
