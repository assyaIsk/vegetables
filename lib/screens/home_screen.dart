import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hello world!',
            ),
            TextButton(
              child: const Text('Next'),
              onPressed: () {
                Navigator.pushNamed(context, '/vegetables');
              },
            )
          ],
        ),
      ),
    );
  }
}
