import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rows and Columns',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Rows and Columns'),
          ),
          body: Center(
            child: Text('Hiya'),
          )),
    );
  }
}
