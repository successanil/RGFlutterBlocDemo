import 'package:flutter/material.dart';
import 'package:flutterdemobloc/counter_event.dart';

import 'counter_bloc.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  //
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }
  //
  // void _decrementCounter() {
  //   setState(() {
  //     _counter--;
  //   });
  // }

  final _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: StreamBuilder(
              stream: _bloc.counter,
              initialData: 0,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${snapshot.data}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                );
              })),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        FloatingActionButton(
          onPressed: () => _bloc.counterEventSink.add(IncrementEvent()),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        SizedBox(width: 10),
        FloatingActionButton(
          onPressed: () => _bloc.counterEventSink.add(DecrementEvent()),
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        )
      ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
