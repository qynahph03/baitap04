import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Builder(
          builder: (BuildContext context) {
            return ElevatedButton(
              onPressed: () {
                Scaffold.of(context).showBottomSheet(
                      (BuildContext context) => Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(16.0),
                    child: Text('Hello'),
                  ),
                );
              },
              child: Text('+'),
            );
          },
        ),
      ),
    );
  }
}
