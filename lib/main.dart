import 'package:flutter/material.dart';
import 'package:side_panels/pages/animated_tree_view_page.dart';
import 'package:side_panels/pages/default_page.dart';
import 'package:side_panels/pages/fancy_tree_view_page.dart';
import 'package:side_panels/pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        //fontFamily: 'HelveticaNeue',
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/ExpansionTile': (context) => const DefaultPage(),
        '/flutter_fancy_tree_view': (context) => FancyTreeViewPage(),
        '/animated_tree_view': (context) => AnimatedTreeViewPage(),
      },
    );
  }
}
