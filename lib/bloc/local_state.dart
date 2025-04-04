import 'package:test_bloc/bloc/local_event.dart';

abstract class CounterState{
  final CounterEvent? lastEvent;
  final int count;
  CounterState(this.count, {this.lastEvent});
}

class IncrementInitial extends CounterState{
  IncrementInitial(super.count);
}

class IncrementLoading extends CounterState{
  IncrementLoading(super.count);
}

class IncrementSuccess extends CounterState{
  @override
  final int count;
  IncrementSuccess(this.count) : super(0);
}

class IncrementError extends CounterState{
  final String error;
  IncrementError(this.error) : super(0);
}