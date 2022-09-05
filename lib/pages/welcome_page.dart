import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/fond.jpeg'),
                  fit: BoxFit.fill,
                  // alignment: Alignment.center
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                    left: 16,
                    right: 16,
                  ),
                  child: ElevatedButton(
                    key: const Key('inputToApp'),
                    style: ElevatedButton.styleFrom(
                        elevation: 10, minimumSize: const Size.fromHeight(40)),
                    onPressed: () {
                      final router = GoRouter.of(context);
                      router.go('/workout-list');
                    },
                    child: const Text(
                      'Use app!',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
