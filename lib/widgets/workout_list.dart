import 'package:flutter/material.dart';

class WorkoutList extends StatefulWidget {
  const WorkoutList({Key? key}) : super(key: key);

  @override
  State<WorkoutList> createState() => _WorkoutListState();
}

class _WorkoutListState extends State<WorkoutList> {
  List<String> workout = <String>[
    'Workout 1',
    'Workout 2',
    'Workout 3',
    'Workout 4'
  ];
  List<String> dateWorkout = <String>[
    '01.10.2022',
    '03.10.2022',
    '05.10.2022',
    '07.10.2022'
  ];

  bool _expanded = false;

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
          return _workoutCard(context, index);
        }
      },
      itemCount: workout.isEmpty ? 1 : workout.length,
    );
  }

  Widget _workoutCard(BuildContext context, index) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Card(
        elevation: 4,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: IconButton(
                onPressed: () => _showDetailsdWorkout(context, index),
                icon: const Icon(
                  Icons.expand_circle_down,
                  size: 30,
                ),
              ),
              title: Text(
                'Название тренировки: ${workout[index]}',
                style: const TextStyle(fontSize: 14),
              ),
              subtitle: Text('Дата тренировки: ${dateWorkout[index]}'),
            ),
          ],
        ),
      ),
    );
  }

  _showDetailsdWorkout(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Row(
            children: [
              Expanded(
                child: Text(
                  'Тренировка: ${workout[index]}',
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.check_box_outlined))
            ],
          ),
          children: [
            SimpleDialogOption(
              child: Text('Дата тренировки: ${dateWorkout[index]}'),
            ),
            SimpleDialogOption(
              child: Column(
                children: [
                  Container(
                    width: 300,
                    decoration: BoxDecoration(border: Border.all()),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text('Упражнение: 1'),
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(border: Border.all()),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text('Подходов: 5'),
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(border: Border.all()),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text('Повторений: 15'),
                    ),
                  ),
                ],
              ),
            ),
            SimpleDialogOption(
              child: Column(
                children: [
                  Container(
                    width: 300,
                    decoration: BoxDecoration(border: Border.all()),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text('Упражнение: 1'),
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(border: Border.all()),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text('Подходов: 5'),
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(border: Border.all()),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text('Повторений: 15'),
                    ),
                  ),
                ],
              ),
            ),
            SimpleDialogOption(
              child: Column(
                children: [
                  Container(
                    width: 300,
                    decoration: BoxDecoration(border: Border.all()),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text('Упражнение: 2'),
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(border: Border.all()),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text('Подходов: 15'),
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(border: Border.all()),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text('Повторений: 15'),
                    ),
                  ),
                ],
              ),
            ),
            SimpleDialogOption(
              child: Column(
                children: [
                  Container(
                    width: 300,
                    decoration: BoxDecoration(border: Border.all()),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text('Упражнение: 3'),
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(border: Border.all()),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text('Подходов: 10'),
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(border: Border.all()),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text('Повторений: 15'),
                    ),
                  ),
                ],
              ),
            ),
            SimpleDialogOption(
              child: Column(
                children: [
                  Container(
                    width: 300,
                    decoration: BoxDecoration(border: Border.all()),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text('Упражнение: 4'),
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(border: Border.all()),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text('Подходов: 5'),
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(border: Border.all()),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text('Повторений: 10'),
                    ),
                  ),
                ],
              ),
            ),
            SimpleDialogOption(
              child: Column(
                children: [
                  Container(
                    width: 300,
                    decoration: BoxDecoration(border: Border.all()),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text('Упражнение: 5'),
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(border: Border.all()),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text('Подходов: 5'),
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(border: Border.all()),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text('Повторений: 10'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
