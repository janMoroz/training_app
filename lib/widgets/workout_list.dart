import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import '../models/workout.dart';

class WorkoutList extends StatefulWidget {
  const WorkoutList({Key? key}) : super(key: key);

  @override
  State<WorkoutList> createState() => _WorkoutListState();
}

class _WorkoutListState extends State<WorkoutList> {
  bool _expanded = false;

  @override
  void dispose() {
    Hive.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<Workout>('workouts').listenable(),
      builder: (context, Box<Workout> box, __) {
        if (box.values.isEmpty) {
          return const Center(
            child: Text('Workouts not found'),
          );
        }
        return ListView.builder(
          itemCount: box.values.length,
          itemBuilder: (context, index) {
            Workout res = box.getAt(index)!;
            final dateWorkout =
                DateFormat('yyyy.MM.dd').format(res.dateWorkout);

            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) => res.delete(),
              background: Container(
                color: Colors.red.shade400,
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    const Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Icon(
                        Icons.delete_forever,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: _expanded
                    ? Card(
                        elevation: 4,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: IconButton(
                                onPressed: () =>
                                    setState(() => _expanded = !_expanded),
                                icon: const Icon(
                                  Icons.expand_less,
                                  size: 30,
                                ),
                              ),
                              title: Text(
                                'Название тренировки: ${res.nameWorkout}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              subtitle: Text('Дата тренировки: $dateWorkout'),
                              trailing: res.complete
                                  ? const Icon(Icons.check_box)
                                  : const Icon(Icons.check_box_outline_blank),
                              onTap: () {
                                res.complete = !res.complete;
                                res.save();
                              },
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Текст тренировки:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(res.textWorkout),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Card(
                        elevation: 4,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: IconButton(
                                onPressed: () =>
                                    setState(() => _expanded = !_expanded),
                                icon: const Icon(
                                  Icons.expand_more,
                                  size: 30,
                                ),
                              ),
                              title: Text(
                                'Название тренировки: ${res.nameWorkout}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              subtitle: Text('Дата тренировки: $dateWorkout'),
                              trailing: res.complete
                                  ? const Icon(Icons.check_box)
                                  : const Icon(Icons.check_box_outline_blank),
                              onTap: () {
                                res.complete = !res.complete;
                                res.save();
                              },
                            ),
                          ],
                        ),
                      ),
              ),
            );
          },
        );
      },
    );
  }
}
