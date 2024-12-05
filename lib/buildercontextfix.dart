import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Scaffold(
      floatingActionButton:
          Builder(builder: (BuildContext context) {
            return (ElevatedButton(onPressed: (){
              Scaffold.of(context).showBottomSheet((BuildContext context) => Text('Hello'));
            }, child: Text('+')));

          }),
    ));
  }
}
