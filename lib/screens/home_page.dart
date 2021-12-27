import 'package:flutter/material.dart';
import 'first_api_test.dart';
import 'second_api_test.dart';

// This is the API homework
// Assigned by: Ayman Abd

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Assignment'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, FirstScreen.routeName);
            },
            child: const Text('first api test'),
          ),
          const Divider(
            color: Colors.transparent,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, SecondScreen.routeName);
            },
            child: const Text('second api test'),
          ),
        ],
      ),
    );
  }
}
