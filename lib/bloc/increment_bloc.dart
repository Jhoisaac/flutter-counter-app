

import 'dart:async';

import 'package:counter_stream/bloc/bloc_base.dart';

class IncrementBloc implements BlocBase{
  int _counter;

  //
  // Stream to handle the counter
  //
  final _controller = StreamController<int>();
  Stream<int> get incrementStream => _controller.stream;

  /*StreamController<int> _counterController = StreamController<int>();*/
  /*StreamSink<int> get _inAdd => _counterController.sink;*/
  /*Stream<int> get outCounter => _counterController.stream;*/

  //
  // Stream to hadle the action on the counter
  //
  /*StreamController _actionController = StreamController();*/
  /*StreamSink get incrementCounter => _actionController.sink;*/

  void incrementCounter() {
    _counter += 1;
    _controller.sink.add(_counter);
  }

  //
  // Constructor
  //
  IncrementBloc() {
    _counter = 0;
    /*_controller.stream
                     .listen(_handleLogic);*/
  }

  @override
  void dispose() {
    _controller.close();
    /*_actionController.close();*/
    /*_counterController.close();*/
  }

  /*void _handleLogic(data) {
    _counter += 1;
    _inAdd.add(_counter);
  }*/ 
}