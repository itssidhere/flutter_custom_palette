import 'package:flutter/material.dart';
import 'package:flutter_custom_palette/flutter_custom_palette.dart';
import 'package:hive/hive.dart';

FlutterCustomPalette palette = FlutterCustomPalette();

void main() async {
  await palette.init();
  palette.put(key: 'myFavColor', color: Colors.red);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    palette.put(
        key: 'myFavColor',
        color: palette.get(key: 'myFavColor') == Color(0xfff44336)
            ? Colors.blue
            : Colors.red);
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: palette.getListenable(keys: ['myFavColor']),
      builder: (BuildContext context, Box value, Widget? child) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: palette.getColor(color: value.get('myFavColor')),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
