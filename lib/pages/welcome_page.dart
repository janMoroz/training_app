import 'package:flutter/material.dart';

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
              print('use app!');
            },
            child: const Text('Use app!'),
          ),
        ),
      ),
    );
  }
}
