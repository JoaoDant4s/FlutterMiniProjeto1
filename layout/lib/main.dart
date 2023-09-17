import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
      child: Column(children: [
        Flexible(
            flex: 1,
            child: Row(
              children: [
                Flexible(
                  flex: 3,
                  child: Container(color: Colors.red),
                ),
                Flexible(
                  flex: 1,
                  child: Container(color: Colors.green),
                )
              ],
            )),
        Flexible(
            flex: 1,
            child: Row(
              children: [
                Flexible(flex: 2, child: Container(color: Colors.red)),
                Flexible(flex: 1, child: Container(color: Colors.blue)),
                Flexible(flex: 1, child: Container(color: Colors.yellow))
              ],
            )),
        Flexible(
            flex: 1,
            child: Row(
              children: [
                Flexible(flex: 1, child: Container(color: Colors.red)),
                Flexible(flex: 1, child: Container(color: Colors.green)),
                Flexible(flex: 2, child: Container(color: Colors.yellow))
              ],
            )),
        Flexible(
            flex: 1,
            child: Row(
              children: [
                Flexible(flex: 1, child: Container(color: Colors.blue)),
                Flexible(flex: 3, child: Container(color: Colors.yellow))
              ],
            )),
        Flexible(
            flex: 1,
            child: Row(
              children: [
                Flexible(flex: 2, child: Container(color: Colors.green)),
                Flexible(flex: 1, child: Container(color: Colors.red)),
                Flexible(flex: 1, child: Container(color: Colors.yellow))
              ],
            )),
        Flexible(
            flex: 1,
            child: Row(
              children: [
                Flexible(flex: 3, child: Container(color: Colors.green)),
                Flexible(flex: 1, child: Container(color: Colors.blue))
              ],
            ))
      ]),
    )));
  }
}
