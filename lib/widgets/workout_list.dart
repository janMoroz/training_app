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

            return Padding(
              padding: const EdgeInsets.all(4),
              child: Card(
                elevation: 4,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: IconButton(
                        onPressed:
                            () {}, //_showDetailsdWorkout(context, index),
                        icon: const Icon(
                          Icons.expand_circle_down,
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
            );
          },
        );
      },
    );
  }

  // Widget _workoutCard(context, index) {
  //   return Padding(
  //     padding: const EdgeInsets.all(4),
  //     child: Card(
  //       elevation: 4,
  //       child: Column(
  //         children: <Widget>[
  //           ListTile(
  //             leading: IconButton(
  //               onPressed: () => _showDetailsdWorkout(context, index),
  //               icon: const Icon(
  //                 Icons.expand_circle_down,
  //                 size: 30,
  //               ),
  //             ),
  //             title: Text(
  //               'Название тренировки: ${workout[index]}',
  //               style: const TextStyle(fontSize: 14),
  //             ),
  //             subtitle: Text('Дата тренировки: ${dateWorkout[index]}'),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // _showDetailsdWorkout(BuildContext context, int index) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return SimpleDialog(
  //         title: Row(
  //           children: [
  //             Expanded(
  //               child: Text(
  //                 'Тренировка: $dateWorkout',
  //                 style: const TextStyle(fontSize: 14),
  //               ),
  //             ),
  //             IconButton(
  //                 onPressed: () => Navigator.pop(context),
  //                 icon: const Icon(Icons.check_box_outlined))
  //           ],
  //         ),
  //         children: [
  //           SimpleDialogOption(
  //             child: Text('Дата тренировки: ${dateWorkout[index]}'),
  //           ),
  //           SimpleDialogOption(
  //             child: Column(
  //               children: [
  //                 Container(
  //                   width: 300,
  //                   decoration: BoxDecoration(border: Border.all()),
  //                   child: const Padding(
  //                     padding: EdgeInsets.all(3.0),
  //                     child: Text('Упражнение: 1'),
  //                   ),
  //                 ),
  //                 Container(
  //                   width: 300,
  //                   decoration: BoxDecoration(border: Border.all()),
  //                   child: const Padding(
  //                     padding: EdgeInsets.all(3.0),
  //                     child: Text('Подходов: 5'),
  //                   ),
  //                 ),
  //                 Container(
  //                   width: 300,
  //                   decoration: BoxDecoration(border: Border.all()),
  //                   child: const Padding(
  //                     padding: EdgeInsets.all(3.0),
  //                     child: Text('Повторений: 15'),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           SimpleDialogOption(
  //             child: Column(
  //               children: [
  //                 Container(
  //                   width: 300,
  //                   decoration: BoxDecoration(border: Border.all()),
  //                   child: const Padding(
  //                     padding: EdgeInsets.all(3.0),
  //                     child: Text('Упражнение: 1'),
  //                   ),
  //                 ),
  //                 Container(
  //                   width: 300,
  //                   decoration: BoxDecoration(border: Border.all()),
  //                   child: const Padding(
  //                     padding: EdgeInsets.all(3.0),
  //                     child: Text('Подходов: 5'),
  //                   ),
  //                 ),
  //                 Container(
  //                   width: 300,
  //                   decoration: BoxDecoration(border: Border.all()),
  //                   child: const Padding(
  //                     padding: EdgeInsets.all(3.0),
  //                     child: Text('Повторений: 15'),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           SimpleDialogOption(
  //             child: Column(
  //               children: [
  //                 Container(
  //                   width: 300,
  //                   decoration: BoxDecoration(border: Border.all()),
  //                   child: const Padding(
  //                     padding: EdgeInsets.all(3.0),
  //                     child: Text('Упражнение: 2'),
  //                   ),
  //                 ),
  //                 Container(
  //                   width: 300,
  //                   decoration: BoxDecoration(border: Border.all()),
  //                   child: const Padding(
  //                     padding: EdgeInsets.all(3.0),
  //                     child: Text('Подходов: 15'),
  //                   ),
  //                 ),
  //                 Container(
  //                   width: 300,
  //                   decoration: BoxDecoration(border: Border.all()),
  //                   child: const Padding(
  //                     padding: EdgeInsets.all(3.0),
  //                     child: Text('Повторений: 15'),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           SimpleDialogOption(
  //             child: Column(
  //               children: [
  //                 Container(
  //                   width: 300,
  //                   decoration: BoxDecoration(border: Border.all()),
  //                   child: const Padding(
  //                     padding: EdgeInsets.all(3.0),
  //                     child: Text('Упражнение: 3'),
  //                   ),
  //                 ),
  //                 Container(
  //                   width: 300,
  //                   decoration: BoxDecoration(border: Border.all()),
  //                   child: const Padding(
  //                     padding: EdgeInsets.all(3.0),
  //                     child: Text('Подходов: 10'),
  //                   ),
  //                 ),
  //                 Container(
  //                   width: 300,
  //                   decoration: BoxDecoration(border: Border.all()),
  //                   child: const Padding(
  //                     padding: EdgeInsets.all(3.0),
  //                     child: Text('Повторений: 15'),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           SimpleDialogOption(
  //             child: Column(
  //               children: [
  //                 Container(
  //                   width: 300,
  //                   decoration: BoxDecoration(border: Border.all()),
  //                   child: const Padding(
  //                     padding: EdgeInsets.all(3.0),
  //                     child: Text('Упражнение: 4'),
  //                   ),
  //                 ),
  //                 Container(
  //                   width: 300,
  //                   decoration: BoxDecoration(border: Border.all()),
  //                   child: const Padding(
  //                     padding: EdgeInsets.all(3.0),
  //                     child: Text('Подходов: 5'),
  //                   ),
  //                 ),
  //                 Container(
  //                   width: 300,
  //                   decoration: BoxDecoration(border: Border.all()),
  //                   child: const Padding(
  //                     padding: EdgeInsets.all(3.0),
  //                     child: Text('Повторений: 10'),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           SimpleDialogOption(
  //             child: Column(
  //               children: [
  //                 Container(
  //                   width: 300,
  //                   decoration: BoxDecoration(border: Border.all()),
  //                   child: const Padding(
  //                     padding: EdgeInsets.all(3.0),
  //                     child: Text('Упражнение: 5'),
  //                   ),
  //                 ),
  //                 Container(
  //                   width: 300,
  //                   decoration: BoxDecoration(border: Border.all()),
  //                   child: const Padding(
  //                     padding: EdgeInsets.all(3.0),
  //                     child: Text('Подходов: 5'),
  //                   ),
  //                 ),
  //                 Container(
  //                   width: 300,
  //                   decoration: BoxDecoration(border: Border.all()),
  //                   child: const Padding(
  //                     padding: EdgeInsets.all(3.0),
  //                     child: Text('Повторений: 10'),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
