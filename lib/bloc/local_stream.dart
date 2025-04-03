import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test_bloc/bloc/local_event.dart';

class LocalStream {
  int counter = 0;
  final StreamController<int> counterController =
      StreamController<int>.broadcast();
  final StreamController<CounterEvent> counterEventController =
      StreamController<CounterEvent>();
  // late final Stream stream;
  StreamSink<CounterEvent> get counterSink => counterEventController.sink;
  Stream<int> get streamCounter => counterController.stream;

  LocalStream() {
    counterEventController.stream.listen(increment);
  }

  Sink<CounterEvent> get eventSink {
    return counterEventController.sink;
  }

  void increment(CounterEvent event) {
    // counter++;
    if (event is IncrementEvent) {
      counter++;
    } else if (event is DecrementEvent) {
      counter--;
    }

    counterController.add(counter);
    debugPrint("${event.runtimeType}");
  }
}
