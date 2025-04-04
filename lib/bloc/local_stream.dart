import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test_bloc/bloc/local_event.dart';
import 'package:test_bloc/bloc/local_state.dart';

class LocalStream {
  int counter = 0;
  final StreamController<CounterState> counterController =
      StreamController<CounterState>.broadcast();
  final StreamController<CounterEvent> counterEventController =
      StreamController<CounterEvent>();
  // late final Stream stream;
  StreamSink<CounterEvent> get counterSink => counterEventController.sink;
  Stream<CounterState> get streamCounter => counterController.stream;
  // Stream<CounterState> get streamState =>

  LocalStream() {
    counterController.add(IncrementInitial(counter));
    counterEventController.stream.listen(counting);
  }

  Sink<CounterEvent> get eventSink {
    return counterEventController.sink;
  }

  void counting(CounterEvent event) async {
    counterController.add(IncrementLoading(counter));
    // counter++;
    await Future.delayed(const Duration(milliseconds: 300));

    try {
      if (event is IncrementEvent) {
        counter++;
      } else if (event is DecrementEvent) {
        counter--;
      }

      counterController.add(IncrementSuccess(counter));
    } catch (e) {
      counterController.add(IncrementError(e.toString()));
      return;
    }

    debugPrint("${event.runtimeType}");
  }
}
