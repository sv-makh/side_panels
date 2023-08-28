import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ExpansionTile');
              },
              child: Text('ExpansionTile'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/flutter_fancy_tree_view');
              },
              child: Text('flutter_fancy_tree_view'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/animated_tree_view');
              },
              child: Text('animated_tree_view'),
            ),
          ],
        ),
      ),
    );
  }
}
