import 'package:flutter/material.dart';
import 'package:test_bloc/bloc/local_event.dart';
import 'package:test_bloc/bloc/local_stream.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = LocalStream();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: StreamBuilder(
          initialData: 0,
          stream: bloc.streamCounter,
          builder: (context, snapshot) {
            return Center(child: Text(snapshot.data.toString()));
          },
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => bloc.counterSink.add(IncrementEvent()),
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () => bloc.counterSink.add(DecrementEvent()),
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
