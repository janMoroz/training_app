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
          return _buildNotExpanded(context, index);
        }
      },
      itemCount: workout.isEmpty ? 1 : workout.length,
    );
  }

  Widget _buildExpanded(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                  child: const Text('Упражнение: '),
                  onTap: () => setState(() {
                        _expanded = false;
                      })),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Text('Упражнение'),
              SizedBox(width: 4),
              Text('Подходы'),
              SizedBox(width: 4),
              Text('Повторы'),
              SizedBox(width: 4),
              Text('Отдых'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNotExpanded(BuildContext context, index) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Card(
        elevation: 4,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: IconButton(
                onPressed: () => _showExpandedWorkout(context, index),
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

  _showExpandedWorkout(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            'Тренировка: ${workout[index]}',
            style: const TextStyle(fontSize: 14),
          ),
        );
      },
    );
  }
}
