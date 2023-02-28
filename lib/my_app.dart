import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_app_hive/pages/create_workout_page.dart';
import 'package:training_app_hive/pages/welcome_page.dart';
import 'package:training_app_hive/pages/workout_list_page.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: '/welcome-page',
    routes: <GoRoute>[
      GoRoute(
        path: '/welcome-page',
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: '/workout-list',
        builder: (context, state) => const WorkoutListPage(),
        routes: [
          GoRoute(
            path: 'create-workout',
            builder: ((context, state) => const CreateWorkoutPage()),
          ),
        ],
      ),
    ],
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
