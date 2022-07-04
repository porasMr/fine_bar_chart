import 'package:fine_bar_chart/fine_bar_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<double> barValue = [50, 30, 90, 60, 80, 25];
  List<Color> barColors = [
    Colors.green,
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.black,
    Colors.purple
  ];
  List<String> bottomBarName = ["B1", "B2", "B3", "B4", "B5", "B6"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(top: 60),
      child: FineBarChart(
          barWidth: 30,
          barHeight: 300,
          backgroundColors: Colors.white,
          isBottomNameDisable: false,
          isValueDisable: false,
          textStyle: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
          barBackgroundColors: Colors.grey.withOpacity(0.3),
          barValue: barValue,
          barColors: barColors,
          barBottomName: bottomBarName),
    ));
  }
}
