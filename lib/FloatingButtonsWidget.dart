/*
 * Copyright (c) 2022. Relsell Global
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'counter_bloc.dart';
import 'counter_event.dart';

class FloatingButtonsWidgets extends StatelessWidget {
  const FloatingButtonsWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = CounterBloc();
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => _bloc.counterEventSink.add(IncrementEvent()),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => _bloc.counterEventSink.add(DecrementEvent()),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      )
    );
  }
}


