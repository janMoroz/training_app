import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_app_hive/widgets/workout_list.dart';

class WorkoutListPage extends StatefulWidget {
  const WorkoutListPage({Key? key}) : super(key: key);

  @override
  State<WorkoutListPage> createState() => _WorkoutListPageState();
}

class _WorkoutListPageState extends State<WorkoutListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade300,
          title: const Text('Workout_app_hive'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: IconButton(
                onPressed: () {
                  _confirmLogout(context);
                },
                icon: const Icon(
                  Icons.exit_to_app,
                  size: 35,
                ),
              ),
            )
          ],
        ),
        body: const WorkoutList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // final router = GoRouter.of(context);
            // router.go('/create-workout');
          },
          backgroundColor: Colors.deepPurple,
          child: const Icon(Icons.fitness_center),
        ),
      ),
    );
  }

  _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        key: const Key('confirmLogout'),
        content: const Text('Вы уверены что хотите выйти?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              final router = GoRouter.of(context);
              router.go('/welcome-page');
            },
            child: const Text('Выйти'),
          ),
        ],
      ),
    );
  }
}
