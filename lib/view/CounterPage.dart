import 'package:counter_stream/bloc/bloc_provider.dart';
import 'package:counter_stream/bloc/increment_bloc.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatelessWidget {
  final String title;

  const CounterPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('\n34 CounterPage:StatelessWidget -> build() executed!');

    final IncrementBloc bloc = BlocProvider.of<IncrementBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: bloc.incrementStream,
          initialData: 0,
          builder: (context, AsyncSnapshot<int> snapshot) {
            print('\n34 CounterPage:StatelessWidget -> StreamBuilder() executed!');

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.incrementCounter(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}