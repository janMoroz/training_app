import 'package:flutter/material.dart';

class WorkoutList extends StatefulWidget {
  const WorkoutList({Key? key}) : super(key: key);

  @override
  State<WorkoutList> createState() => _WorkoutListState();
}

class _WorkoutListState extends State<WorkoutList> {
  List<String> workout = <String>[
    // 'Workout 1',
    // 'Workout 2',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (workout.isEmpty) {
          return const Padding(
            padding: EdgeInsets.only(top: 40),
            child: SizedBox(
                height: 50,
                child: Center(child: Text('Список тренировок пуст'))),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              color: Colors.blueGrey.shade100,
              child: SizedBox(
                  height: 50,
                  child: Center(child: Text('Entry ${workout[index]}'))),
            ),
          );
        }
      },
      itemCount: workout.isEmpty ? 1 : workout.length,
    );
  }
}
