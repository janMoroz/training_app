import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ElevatedButton(
            key: const Key('inputToApp'),
            style: ElevatedButton.styleFrom(
                elevation: 10, minimumSize: const Size.fromHeight(40)),
            onPressed: () {
              final router = GoRouter.of(context);
              router.go('/workout-list');
            },
            child: const Text('Use app!'),
          ),
        ),
      ),
    );
  }
}
