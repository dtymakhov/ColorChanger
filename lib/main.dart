import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(ColorChanger());

class ColorChanger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MainPage(title: 'Color Changer'),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var randomColor;
  void _changeBackgroundColor() {
    setState(() {
      randomColor = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: randomColor,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            _changeBackgroundColor();
          },
          child: Center(
            child: Text(
              'Hey there',
              style: TextStyle(fontSize: 30),
            ),
          )),
    );
  }
}
